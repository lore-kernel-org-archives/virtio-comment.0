Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955E3D903E
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037756; cv=fail; b=howYaUh5ccIEjp96mQXw+hm09pGmC4zPGKN0W+OV00QyWBkyg0QJ0FO+Vk3gxDzXpXpAczrwRlBck1yzCHuucEWge18vLuCeuczt/SFGCZhzCJ2EpncJmAjhbaXYPNz3+zsD9sflj/nwcbs53R+IFiyh8F/nm1UZIxt35QA9a5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037756; c=relaxed/simple;
	bh=Kc7kt51+d+BgP0a0WcZUXYB3LqOBjjeckDVGUHlycG0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5wWB3r9AwKOAYHTYVJ96R5B7GTwB4aCPk272c8OsSffGEc8p3gvJ4jATfnNoZaNXwtrKXyzBL5pVcZEB45A+/eswQw8EwzMDoCn5Wx9MrXM7hH0FrL/nWtx2OoE1IYTxnrlnGRUSRYMhT6mJBpVdJe0jW7/uGbTT8kBdlNvmHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=elgwAZXb; arc=fail smtp.client-ip=52.101.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="elgwAZXb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCbyRJ8hKXJLL20WMWP/J+p2nA7pm7uCBPy52SK31aTxz784yNimNSif07O55or3PlQHuGCGrJH/Epp9k5UJ4KlvHgphvXXS6XNvWbQTLSf0bC87GZfTP3dzWB/KxV7iIy7gfPMimk5NCVIHGfeMahRVq7uG5gHDAyBkBYC42nj5o3xG3u5vaCotqNR+qRmQOVxawn9gsQryndn+i00uyPD5PF3fEvw0DGU7BSSYXLkl7VCB5IcvyG8jT2nbbRTufb8KOtTVr3yA99dAXNFNZKgXqYmksS3HPR7p6KkvRVxxg41bQi5QMgcxhzcqflXCzwzrxFrGPsD0NwKvQ1PCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGY+rPZ0xxvtTNTVKd6HKUOLQ0J3TqAbA5G6hq8GMDI=;
 b=NVK4Y7+oqeJlnKK92+orfITixrCaQs1u/pyylmKHaAHlL6EYxC2qdCd0U9M3pmbepN5FzEJVJZb1XYFn0GBvSjQNEsBbrt1wzfxw+c1YfzU2fupfW1fMPZnr9hglSE7ejzzCyCJr5vVTMCNrUBjUrYVJLYwYr1ciSqKTPvembsuH+uCgKpAjehOJnZJoem1G1o48TZUvvzMz9Hhy3zNRjBqvAJZvnc7jHre/HvLnGZ7e3KskH5Cr7sgfAnSERDOqgdQBqCORfD/t6TRocFpBbs/VxP8IHV96EuF3qy4KE3jCVFE/cCpL2KlpND10/OSDhnGqL7H2qr1bQ+VZkvahkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGY+rPZ0xxvtTNTVKd6HKUOLQ0J3TqAbA5G6hq8GMDI=;
 b=elgwAZXb2QI2wnUwx1QxynWuJg4bJZopQxM9tV6/PaiYr2DFEaPjPDHnvHZ/zR4fR+BJYH95yW2JNeWxWEVJb60v4GuJxSMytzPDekiJ5YVpNg2Ced5VFelB7SpnG/wRlyY3RljoTDGh2NB6jxTfuIoY0w9Shhi1P0fdNph50Dk=
Received: from CH5P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::8)
 by CH3PR12MB8548.namprd12.prod.outlook.com (2603:10b6:610:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 16:42:29 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::52) by CH5P221CA0021.outlook.office365.com
 (2603:10b6:610:1f2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Wed,
 25 Feb 2026 16:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 16:42:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 10:42:26 -0600
Date: Wed, 25 Feb 2026 17:42:20 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <aZ8mbL1xi7XMF89R@zapote>
References: <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|CH3PR12MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d2ba48-6f90-41f0-10c5-08de748cdc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	atq2cI9Lelk3ocuYBitwzP4LdWwSH51fvcdh8T4p5SaJKB1EeGwOOwLehmyGaoGJS63C/tyD8dltjcdeXEokJw4vJNcnNC4XnjEL6twIfKTqrnPFRRkag73SqPm/Z7IwlhcQadbKflCv3IPo+5lxpIevI3Xe3Jenapmr11U6u5aTcR3XSOIWVaV7QjWyL8Tn4OK+uN12vE0d6PJL5hTcVnjXObaBbLuNLOY7/FtSNXkAQ6+JS5xA+c9ZB9QfdaclPHIRf3Q2uHg1urMdMiKv5Z1sx3CKNxA5nWsH1B/0rV7MUfonVMT+e/sVmHgOhiQUxpD6qOrNjWEDNNmcPVdSCDBmLaYEqjtcoxsp5nFSyCOELskbR+lBSCNOKNDCJ8DShoyfTljOU23q0gLw6+gdGErRUyg5chFMOWP9Cj7M7zqgBtOm4WxTiDsxPDXaQDOQw7OpLMtwNksQdIhIiuIceEV2tlvlIXJMOtzGm3ItcMj/UPFq4UXqKbUI+wah1bgEN0jfqhALTeXHMIC4BkMnkSrowxdI8pi3owppn9rnaIFqBWJ4QOB8am5WANNUpe229Th3fJfEa/2mMwTyd17CjDPSaKIv4H8weoJ5I1vM+wQ69Bw7Gwq39zVpl94DoM7f3WDH13R9vrGmrQk4jzn9wQ3ce4QDZX0n6aEefUau+f45tPY1zXXDi+PWngOsfqCj/RP6X+whTRfM9QMs2xBIEhmaJsKEr+qqJjQRLdblFBZrlEVUH3Ilim3US1KRVzTqaDYwZVGxtNH5Yl1PwGMt1QqZTM8Sh+Y9XelxGd8Q/d5FNvpIIdCtSFqqpKecCL5EaBRT03LFoj6lEYZwaNZpKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+/mKXx54mON2eDGjq05P8sZ0qxAeXWS4+Le68zBHHzOQhwG0JijGlcaTQAS0ZjjtstJLb+gT3HTKl16cYCrWL3iZubvi3j0e0ljOnLH1FLYrY8TDJi89abKj6sqSdFa/+6sbN2cKhnJJqQNqcxU2EZVAWYH70GarPjqTSaK1xl3WdDFW3FtYwUCtFhXtAaID5ZDR5gN8l7ihm85uXufBkuIogHffRGcBmWn0/q3YkG15wNVkdv6o7JTz6di9z37rWiyoxschDIoLy5+032twhG4vHxDxg2R1C0VAnx6PX9HTU32/H9EibaVqbY56AG8Du79FjfTszrsUna4E2JSpmHiZg76cVVVFX0TSpAZKU4XJc648tn2CC7tTe1TPbeYrFBD+oshcp1nGgqDYPSX1OD0ZEhDoadKpLsGWAEEPuu1TOArQbzmobd/5r8pEwBSE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 16:42:27.3889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d2ba48-6f90-41f0-10c5-08de748cdc5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548

On Wed, Feb 25, 2026 at 02:53:58PM +0000, Bertrand Marquis wrote:
> Hi,
> 
> > On 25 Feb 2026, at 15:49, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 02:45:35PM +0000, Parav Pandit wrote:
> >>
> >>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> >>> Sent: 25 February 2026 04:06 PM
> >>>
> >>> Hi Parav,
> >>>
> >>>> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
> >>>>
> >>>>>
> >>>>> From: Manivannan Sadhasivam <mani@kernel.org>
> >>>>> Sent: 25 February 2026 03:37 PM
> >>>>>
> >>>>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
> >>>>>> Hi Manivannan,
> >>>>>>
> >>>>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >>>>>>>
> >>>>>>> Hi Bertrand,
> >>>>>>>
> >>>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> >>>>>>>> Hi Parav,
> >>>>>>>>
> >>>>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>> Sent: 20 February 2026 05:25 AM
> >>>>>>>>>>
> >>>>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> >>>>>>>>>>> Hi Bill,
> >>>>>>>>>>>
> >>>>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
> >>>>>>>>>>>> Sent: 26 January 2026 10:02 PM
> >>>>>>>>>>>>
> >>>>>>>>>>>> This series adds the virtio-msg transport layer.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The individuals and organizations involved in this effort have had difficulty in
> >>>>>>>>>>>> using the existing virtio-transports in various situations and desire to add one
> >>>>>>>>>>>> more transport that performs its transport layer operations by sending and
> >>>>>>>>>>>> receiving messages.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Implementations of virtio-msg will normally be done in multiple layers:
> >>>>>>>>>>>> * common / device level
> >>>>>>>>>>>> * bus level
> >>>>>>>>>>>>
> >>>>>>>>>>>> The common / device level defines the messages exchanged between the driver
> >>>>>>>>>>>> and a device. This common part should lead to a common driver holding most
> >>>>>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
> >>>>>>>>>>>> The kernel implementation in [3] shows this separation. As with other transport
> >>>>>>>>>>>> layers, virtio-msg should not require modifications to existing virtio device
> >>>>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
> >>>>>>>>>>>> main focus of this version of the patch series.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The virtio-msg bus level implements the normal things a bus defines
> >>>>>>>>>>>> (enumeration, dma operations, etc) but also implements the message send and
> >>>>>>>>>>>> receive operations. A number of bus implementations are envisioned,
> >>>>>>>>>>>> some of which will be reusable and general purpose. Other bus implementations
> >>>>>>>>>>>> might be unique to a given situation, for example only used by a PCIe card
> >>>>>>>>>>>> and its driver.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The standard bus messages are an effort to avoid different bus implementations
> >>>>>>>>>>>> doing the same thing in different ways for no good reason. However the
> >>>>>>>>>>>> different environments will require different things. Instead of trying to
> >>>>>>>>>>>> anticipate all needs and provide something very abstract, we think
> >>>>>>>>>>>> implementation specific messages will be needed at the bus level. Over time,
> >>>>>>>>>>>> if we see similar messages across multiple bus implementations, we will move to
> >>>>>>>>>>>> standardize a bus level message for that.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I would review more, had first round of sparse review.
> >>>>>>>>>>> Please find few comments/questions below.
> >>>>>>>>>>
> >>>>>>>>>> I'd like to comment that I think it makes sense to have a basic simple transport and
> >>>>>>>>>> then add performance features on top as appropriate.
> >>>>>>>>> Sounds good. Simple but complete is needed.
> >>>>>>>>
> >>>>>>>> Agree.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> So one way to address some of these comments is to show how
> >>>>>>>>>> they can be addressed with a feature bit down the road.
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
> >>>>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use case for more than 64k devices.
> >>>>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
> >>>>>>>>>>>
> >>>>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> >>>>>>>>>>> For example, a TCP stream wants to send 64KB of data + payload, needs more than 64KB data.
> >>>>>>>>>>> Needs 32-bits.
> >>>>>>>>>>>
> >>>>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (instead of READY)
> >>>>>>>>>>> But more below.
> >>>>>>>>>>>
> >>>>>>>>>>> 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> >>>>> operate
> >>>>>>>>>> the virtqueues.
> >>>>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> >>>>>>>>>>
> >>>>>>>>>> surely this can be an optional transport feature bit.
> >>>>>>>>>>
> >>>>>>>>> How is this optional?
> >>>>>>>>
> >>>>>>>> As said in a previous mail, we have messages already for that.
> >>>>>>>> Please confirm if that answer your question.
> >>>>>>>>
> >>>>>>>>> How can one implement a transport without defining the basic data transfer semantics?
> >>>>>>>>
> >>>>>>>> We did a lot of experiments and we are feature equivalent to PCI, MMIO or Channel I/O.
> >>>>>>>> If anything is missing, we are more than happy to discuss it and solve the issue.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I'd love to have this transport over PCI because it addresses the shortcomings
> >>>>>>> of the existing PCI transport which just assumes that every config space access\
> >>>>>>> is trap and emulate.
> >>>>>>
> >>>>>> Agree and AMD did exactly that in their demonstrator.
> >>>>>> I will give you answers here as i know them but Edgar will probably give you more
> >>>>>> details (and probably fix my mistakes).
> >>>>>>
> >>>>>>>
> >>>>>>> But that being said, I somewhat agree with Parav that we should define the bus
> >>>>>>> implementations in the spec to avoid fixing the ABI in the implementations. For
> >>>>>>> instance, if we try to use this transport over PCI, we've got questions like:
> >>>>>>>
> >>>>>>> 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> >>>>>>> the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> >>>>>>
> >>>>>> One bus is appearing as one pci device with its own Vendor ID,
> >>>>>>
> >>>>>
> >>>>> What should be the 'own Vendor ID' here?
> >>>>>
> >>>>> The existing virtio-pci driver binds to all devices with the Vendor ID of
> >>>>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use their own
> >>>>> VID for exposing the Virtio devices? That would mean, the drivers on the host
> >>>>> need update as well, which will not scale.
> >>>>>
> >>>>> It would be good if the existing virtio-pci devices can use this new transport
> >>>>> with only device side modifications.
> >>>>>
> >>>>>>>
> >>>>>>> 2. How the Virtio messages should be transferred? Is it through endpoint config
> >>>>>>> space or through some other means?
> >>>>>>
> >>>>>> The virtio messages are transfered using FIFOs stored in the BAR of the PCI
> >>>>>> device (ending up being memory shared between both sides)
> >>>>>>
> >>>>>
> >>>>> What should be the BAR number and size?
> >>>>>
> >>>>>>>
> >>>>>>> 3. How the notification be delivered from the device to the host? Through
> >>>>>>> INT-X/MSI/MSI-X or even polling?
> >>>>>>
> >>>>>> Notifications are delivered through MSI.
> >>>>>>
> >>>>>
> >>>>> So no INT-X or MSI-X? Why so?
> >>>>>
> >>>>> Anyhow, my objective is not to get answers for my above questions here in this
> >>>>> thread, but to state the reality that it would be hard for us to make use of
> >>>>> this new transport without defining the bus implementation.
> >>>>>
> >>>> +1 to most of the points that Manivannan explained.
> >>>>
> >>>> The whole new definition of message layer for the PCI does not make any sense at all where expectation for the device is to build yet
> >>> another interface for _Everything_ that already exists.
> >>>> and device is still have to implement all the existing things because the device does not know which driver will operate.
> >>>>
> >>>> And that too some register based inefficient interface.
> >>>> Just to reset the device one needs to fully setup the new message interface but device still have to be working.
> >>>> That defeats the whole purpose of reset_1 and reset_2 in the device.
> >>>>
> >>>> This does not bring anything better for the PCI devices at all.
> >>>>
> >>>> A transport binding should be defined for the bus binding.
> >>>> A bus that chooses a msg interface should be listed that way and bus choose inline messages can continue the way they are.
> >>>>
> >>>> If we are creating something brand-new, for PCI the only thing needed is:
> >>>> 1. Reset the device
> >>>> 2. Create an admin virtqueue
> >>>> 3. Transport everything needed through this virtqueue including features, configs, control.
> >>>>
> >>>> And this will work for any other bus or msg based too given only contract needed is to creating the aq.
> >>>
> >>> I think you misunderstood a bit the point of virtio-msg bus over PCI so let me try to explain.
> >>>
> >>> You see one PCI device (regular, not virtio) which is a "virtio-msg bus over PCI".
> >>>
> >>> When the virtio-msg bus over PCI it will communicate through this device with an external
> >>> system connected through the PCI bus.
> >>> The driver will enumerate virtio devices available behind this bus and register them so that
> >>> the corresponding virtio drivers are probed for them.
> >>> All virtio-msg messages required to communicate with those devices will be transferred through
> >>> a FIFO stored in the BAR of the pci device and standard PCI DMA will be used to share the
> >>> virtqueues with all the devices on the bus.
> >>>
> >>> So the PCI device is not one virtio device but one bus behind which there can be many devices.
> >>>
> >>> Is this making the concept a bit clearer ?
> >>>
> >> Yes. This makes a lot of sense now.
> >>
> >> This is a virtio-msg-transport device that needs its own device id in the table.
> >> And its binding to the PCI transport.
> >
> > ok. how about an rfc of that idea on the list?
> 
> 
> I will let Edgar answer on this.


Yes, I agree it makes sense to document the virtio-msg PCI bus.

We've been looking at a virtio-msg PCI bus for several reasons. One is to
share devices between two SoCs connected over PCI, e.g., an x86 host and an
ARM endpoint.

To enable virtio-msg, we need shared memory for FIFOs plus notifications in
both directions. We also need DMA for virtqueue access.

In the simple case where the endpoint shares devices to the host, we have a
BAR0 with notification registers (host to EP) and a prefetchable BAR1 with RAM
for FIFOs. We implement software FIFOs in RAM and move virtio-msg messages
over these. When the host needs to notify the EP, it writes to the
notification registers in BAR0. When the EP needs to notify the host, it
raises an interrupt (we're using MSI-X now, but it could be MSI or INTX).

When the device model running on the EP needs to access the host's VQs, it
uses ordinary PCI DMA.

When the host wants to share a device with the EP, we need an additional
large BAR2 (e.g., 4 GB) to expose EP memory to the host for DMA. The virtio-msg
queues work the same way as in the first scenario, but DMA to the VQs is done
over BAR2. This is still a work in progress, but we have a setup that
demonstrates EP-to-host sharing.

In our setup, we're using virtio-msg to share devices between host kernels,
e.g., dom0 on the x86 and dom0 on the ARM side. To share with guests we're
currently re-sharing using virtio-pci to support unmodified
non-virtio-msg-capable guests. If we wanted to do virtio-msg end-to-end
between guests, we'd need to multiply the PCI functions to address the IOMMU
issue that Parav mentioned, either by using multiple functions or multiple
VFs (SR-IOV) (one per guest). This is something we've talked about but not
yet tried.

A second reason for looking at PCI was to provide a hypervisor-neutral and
easy way to access and try virtio-msg. So we created a QEMU model of the
EP-to-host sharing mechanisms described above. This is what we've submitted
to QEMU as the virtio-msg AMP PCI device.

https://lore.kernel.org/qemu-devel/20260224155721.612314-1-edgar.iglesias@gmail.com/
