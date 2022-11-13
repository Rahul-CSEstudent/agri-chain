import Register from "../../components/farmer/register";
import { ThirdwebWeb3Provider } from '@3rdweb/hooks';

export default function MyApp() {
    const supportedChainIds = [1, 4, 137];
    const connectors = {
        injected: {},
    };
    return (
        <ThirdwebWeb3Provider
            supportedChainIds={supportedChainIds}
            connectors={connectors}
        >
            <Register />
        </ThirdwebWeb3Provider>
    );
}