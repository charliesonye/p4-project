import React, {useState} from 'react'
import {useParams, useNavigate} from 'react-router-dom'

 function EditComp({onUpdateComps, onShowEdit, showEdit, comp}) {
  const [compName, setCompName] = useState('')
  const params = useParams()
  const navigate = useNavigate()

  function handleSubmit(e){
    e.preventDefault()
    
    fetch(`/competitions/${params.id}`,{
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({name: compName})
    })
    .then((res)=> res.json())
    .then((newName)=> {
        
        onUpdateComps(newName)
        onShowEdit(!showEdit)
        navigate('/competitions')
       
        
    })
    
  }
    return (
    <div>
        <form onSubmit={handleSubmit}>
            <label>New Competition Name:</label>
            <input type='text' value={compName} onChange={(e)=>setCompName(e.target.value)} />
            <input type='submit' />
        </form>
    </div>
  )
}

export default EditComp