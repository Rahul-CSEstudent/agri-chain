import { useWeb3 } from "@3rdweb/hooks";
import { useEffect, useState } from "react";


export default function Register() {
    const [name, setName] = useState("");
    const [phone, setPhone] = useState("");
    const [error, setError] = useState("");

    const { address, connectWallet, } = useWeb3();

    useEffect(() => {
        if (address) {
            console.log(address);
        }
    }, [address])

    function handleSubmit() {
        console.log(name, phone);
        let errors = "";
        if (name === "") {
            errors += "Name is required. ";
        }
        if (phone === "") {
            errors += "Phone is required. ";
        }
        if (!address) {
            errors += "Please Connect to wallet. ";
        }
        if (errors !== "") {
            setError(errors);
            return;
        } else {
            setError("");
        }
        // TODO: call contract to register farmer
    }
    return (
        <section className="text-gray-600 body-font">
            <div className="container px-5 py-24 mx-auto flex flex-wrap items-center">
                <div className="lg:w-2/6 md:w-1/2 rounded-lg p-8 flex flex-col mx-auto w-full mt-10 md:mt-0">
                    <h2 className="text-gray-900 text-lg font-medium title-font mb-5">Register Yourself as Farmer</h2>
                    {address &&
                        <div className="relative mb-4">
                            <label htmlFor="address" className="leading-7 text-sm text-gray-600">address</label>
                            <input disabled={true} type="text" value={address} id="address" name="addresss" className="w-full bg-white rounded border border-gray-300 focus:border-green-500 focus:ring-2 focus:ring-green-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
                        </div>
                    }
                    <div className="relative mb-4">
                        <label htmlFor="full-name" className="leading-7 text-sm text-gray-600">Full Name</label>
                        <input onChange={(e) => setName(e.target.value)} value={name} type="text" id="full-name" name="full-name" className="w-full bg-white rounded border border-gray-300 focus:border-green-500 focus:ring-2 focus:ring-green-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
                    </div>
                    <div className="relative mb-4">
                        <label htmlFor="phone" className="leading-7 text-sm text-gray-600">Phone Number</label>
                        <input onChange={(e) => setPhone(e.target.phone)} value={phone} type="tel" id="phone" name="phone" className="w-full bg-white rounded border border-gray-300 focus:border-green-500 focus:ring-2 focus:ring-green-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
                    </div>
                    {!address &&
                        <button onClick={() => connectWallet("injected")} className="mb-4 text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">Connect Metamask</button>
                    }
                    <button onClick={handleSubmit} className="text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">Register !</button>
                    {error && <p className="text-xs text-red-500 mt-3">{error}</p>}
                    <p className="text-xs text-gray-500 mt-3">A lot of great opportunities awaiting for you</p>
                </div>
            </div>
        </section >

    )
}