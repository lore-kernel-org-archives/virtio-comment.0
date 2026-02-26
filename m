Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EED368955
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 22:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143722; cv=fail; b=aI0nhTtO5KBs6vOaTSlETFXc4GhZ1MrjAjmqsrsM4pSX1S0Uta6HkdL08qfJrz6YP3SABvrUASiOHtSeHtCPtNzvKrEvoRuddf+22piwZONejMd+mgL3mTsdi+FYHsxeNj6rJ9U1thAjbauu4bYzEOSPULHHcMBQXsKT4h01IUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143722; c=relaxed/simple;
	bh=ldweA+zZHh9tfpNqtMuglwHKu9cBRafUTvXX4G+rdVo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5VvB+wG+B6y8Qs32j6LCWiTgeyaWt7772SnVG4EY3tAJwyKA+MTvNLP4vpYPytZp0g6VjAU2+0b+e4VcDsyzOv5Ks/L/C3jRkFZkOBbYAA0rwbSG5JJZkvpE2ndrXsj0CfSkzv00Naw/hbppQgfQA77f9pLWlOidoaiw9d/QWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ub1Dli6h; arc=fail smtp.client-ip=40.93.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ub1Dli6h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6jaZe7JlPz/xhcd2hYBOtGHE1sC72WtHHBRuM19Tl8EnDciE5NsHPKMeGWoMehAXVgR7a3bIXnZQtUAFqf3/Fd54N+CwktZ49Kv2xhTcvwz4jgR+mFounsysRop1z+HfVLN1wFCEsEgmteeziChRwa4YLWXA2B/trQebS7/dKOcDZcTXkDyIitmEnHDa6bMrhsSIRzeQwtZDQIDzJ30L0G8mXpNF0PdbjfOa9l5NhyZg19VEA4M8Sw6xTGZKyFrY9vhslAP+BBiNSFeNVGQOL8OHuwfPNvyaLUieLeKbg2a3V4S9uOGjbedn7fpLOaDr8TvreyGhivvbB3lC/zz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhRsiLpy5dZd2bJwZ1SJ7iW0M32IGYM9pl6eGe2NiRM=;
 b=c5XYNeIqbZGJg0Abnlpxrtp5gh6YD+OKYJV3/27wDszdoZe1dqwcUMTkAfNd7Msgw5s/7tNPe0W+dbKjmBbKnXHT7jgGYiI/7rkpsiORmDXvRK+ak/PbPHUmXN0ftt/vrh8p2Bssb1CiWj1jDD3EjUeocbOZ+ckbeNpH/gWAbNYLx/9LS7YEOOzXByBAk5jprUnCc0cVtdJMBYml9wtnjRyvB8FCFQ88ZFnmv9D3jz8de/LkucowXXVNxOZsHHOeMbF5nlNPmFkq1orXuPlSA/yOpu/qyQY9hLImIouT/iYORfXlIYqGn8lUhOUyGY3rCejBbdELlY0FN97BGVxLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhRsiLpy5dZd2bJwZ1SJ7iW0M32IGYM9pl6eGe2NiRM=;
 b=Ub1Dli6hD7Ut61oJQk90ttH3ni77CuvLFxmHAQPCpOx14mc33w9j5tGXlNjkhUxdqJ2ZnnVNNOUWKtmHGWRLAYV0pHR3W1s6qgFb4CnyKIROZEEBtaUNnDMm3d4OTtZMfj8KATzUN0fi/ZbzDhuvWVV1O9GYXD8KI3WBDIjqDfs=
Received: from BLAPR05CA0039.namprd05.prod.outlook.com (2603:10b6:208:335::20)
 by CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 22:08:35 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::92) by BLAPR05CA0039.outlook.office365.com
 (2603:10b6:208:335::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.15 via Frontend Transport; Thu,
 26 Feb 2026 22:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 22:08:35 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 16:08:35 -0600
Date: Thu, 26 Feb 2026 23:08:33 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <aaDEYbBxGQE5S70i@zapote>
References: <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
 <ac6676b6-f33c-40af-8587-9358809f9243@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac6676b6-f33c-40af-8587-9358809f9243@gmail.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 9077b138-fa37-42df-843f-08de75839670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	AVPoHz5kdAPst4Jfh4UnhDp3fwfHUBlaVDxV9N479mwSh8iZwb0CfuQad/6mgAt0x9G0nNOczz8hcrfd8+41ZykbMbToao50rUjZIMKED4L90gggd4NjK6eMiqG4faiwWH50phfgICZ3NRM/4Qm108t7vjRD4c5CqRRdDGCYdp67R0AhMNQLZDd1JyVE/miUnWheqmYyc9xX59Gp6b9acJh0gNOMdBJ7MWMwIhsozgopv90wu+Ckzuf9KeDQ6dgoOlaqMWhzI/KTnpIAd6Y3I/YWdITRcZC+uLWlHYwNwRyA70OYpwBJP72zplJD7K4oOeUGPChRx3KDJ0r+7KWxGsSeXfZNZk3LEvkxH21ANvEVGQbO6nvuTQEx4ILAbIjpb/06SsTRyRXGdONFjdJ02KCFqVERIqZ2VWeLJ+g0QozFtUM6y3dRcVeeekpuAGmfaZuSEAb4g00XlMNDmqDKNxx9aTVoL/1gQgs2tgcRIOdvZah2bhFj/toSOtrIG/U1CARNSgGSGOebr/akajKRnRRCO911ffpbdV1iHJw9qTJNdOFQa1gubxaE9kkreehzaty8dtmfmErfPNht4+kWSFVkD2dW3nqxcg1EzRB/P+DDSmPBfYXo/PdzgBvoVvFH67Q5jCiw9nbrRfGOBhNpUKSndRrTHehbbeeTVTu7hqGCTmJ7niWUAXxcqDpn+ynDm8mi+uwH8kHZLSjH1TNg+xzSRcGTqUXemy20Z0NrNHgr5LjadILIRL9Yq2tr2T4LtmzIZ6UI67GGDq6adrrOpyIix2WeCStKH2SZCtHj00Kr5/YNd28sn92JpV8IaB5R9j3ieYOo8CdrpcaxXM8Qfg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YG6VvABdZlJthAn91SM6uyES9+eOizIymG/t+/7dlFOsCY9ZNk416GtZvrsgNJTTe/4U4rfs/Pauhn7HUzCiu+KRUGXPHJPl5IcC9qOSPVwtVDBQ9LJba2aTkp1N3gWRPKH0vKZykb2rB0Z1Mwj0bWIoOHWZLrop/Ytgt5ln/wlQZPG2E6vRYCy/GIuLTyTrHvTFd2u5aKecsmk0cprpJBDdhWnlihNfPFnnGS4Cw7WQ9PE2PqsJcPrMifyRRHzRgw+IrB4TRnw+ZZX4mmiydJ0Snad18VRzrtwgiOGPT7bWWjpu6p7SBI/ma5w0kZi0Kkw4GMrn3mnAdZaPcfF3RVFwLpy2LfqjtqFzimQgNJSRAeUCd2KS2Zo2qvCUrHxi3tRBACwiD8sa8n8ZvmgnG4VL2H1PgymVXm8WjCeJw3JTO2wZBx9MBcdIz3UrfHNJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:08:35.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9077b138-fa37-42df-843f-08de75839670
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933

On Thu, Feb 26, 2026 at 02:20:01PM -0500, Demi Marie Obenour wrote:
> On 2/26/26 00:36, Manivannan Sadhasivam wrote:
> > On Wed, Feb 25, 2026 at 03:15:39PM +0000, Parav Pandit wrote:
> >>
> >>> From: Manivannan Sadhasivam <mani@kernel.org>
> >>> Sent: 25 February 2026 08:41 PM
> >>>
> >>> On Wed, Feb 25, 2026 at 03:00:19PM +0000, Parav Pandit wrote:
> >>>
> >>> [...]
> >>>
> >>>>>>> Yes. This makes a lot of sense now.
> >>>>>>>
> >>>>>>> This is a virtio-msg-transport device that needs its own device id in the table.
> >>>>>>> And its binding to the PCI transport.
> >>>>>>
> >>>>>> ok. how about an rfc of that idea on the list?
> >>>>>
> >>>>>
> >>>>> I will let Edgar answer on this.
> >>>>>
> >>>> Sure.
> >>>> Also please explain how is this different than SR-IOV devices?
> >>>> On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> >>>> And all of them are going to share same PCI BDF.
> >>>> These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> >>>> So what would this virtio-msg-transport device achieve?
> >>>>
> >>>
> >>> IDK why you are comparing this transport with SR-IOV, which altogether serves a
> >>> different purpose.
> >>>
> >> In the example showed there are multiple devices behind one PCI device.
> >> Why is it not similar to SR-IOV that does exactly that, on one PCI link, exposes multiple devices.
> >>
> > 
> > That could be one usecase, but not the actual design.
> > 
> >>>> If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> >>>> But underlying transport being PCI, its back to square one for the originally described motivation.
> >>>>
> >>>
> >>> Even with PCI as the physical bus, we don't need any trap and emulate assumption
> >>> with this transport, because the communication is message based, not writing and
> >>> reading registers directly in the BAR memory.
> >>>
> >> That is true. Somewhere in this thread, there was mention of trap+emulation as reason to create some msg based transport.
> >> So I do not know why t+e was mentioned.
> >> I don’t have the link to that email at the moment.
> >>
> > 
> > I mentioned that because to run the existing Virtio PCI one would need an
> > emulated PCI device. I think it is also possible to expose custom designed HW as
> > a Virtio PCI device, but that's not the majority.
> 
> I suspect that HW virtio-PCI implementations do exist.
> That's the purpose of ACCESS_PLATFORM if I recall correctly.
> 
> > One primary example is how the virtqueue configuration happens. The driver
> > selects the queue by writing to the 'queue_select' and immediately it expects
> > the device to select that virtqueue and give response in other fields such as
> > 'queue_size'. This only happens in an emulated PCI bus. But in a real PCI bus,
> > the device on the other end cannot synchronize itself with the host. And this is
> > what being fixed by the message based communication.
> > 
> > We tried using the existing Virtio PCI transport in a design where two SoCs are
> > connected using PCIe bus, both running Linux. One will act as Virtio Frontend
> > and another as backend. Then we ran into all sort issues due to the above
> > mentioned assumption/expectation by the transport.
> My understanding is that PCIe guarantees TLP ordering and that reads
> are implemented as messages that require a response.  If so, the
> write and read TLPs will appear in the appropriate order and could
> be handled correctly.
> 
> However, this would require the PCIe endpoint support software-defined
> MMIO reads.  Is this something that is supported, or is it not an
> option due to latency requirements, at least without wasting a CPU
> core on polling?

Right, I think it would be hard to get something like that to perform well.
We would also need the HW logic to hand-over memory accesses to SW and
back..

There are several benefits with a message-based transport compared to
trap+emulate, for example:

1. Trap and emulation is not really available in AMP scenarios. It could
be worked around by trapping locally and converting each memory access
into some kind of message (like Xen IOREQs) but this adds complexity and
latency. With an end-to-end message based transport we can natively speak
across system boundaries.

2. Real-time. Imagine a guest with a single core running some
kind of real-time sensitive workload. Whenever guests access a register,
traps and emulates, the guest "stalls" for the time it takes to respond
to the trapped access. This can lead to high response times which can be
hard to quantify depending on the device implementation.

With a message based transport, guests crafts messages, send them
over and can do other work (e.g take interrupts) while waiting for
responses.

Best regards,
Edgar
