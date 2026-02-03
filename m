Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C328C13B
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148099; cv=fail; b=mzUap6MIeT1t5dn42x23gPAJMeTPEpE8eIfaIy3IuSSvoI6tPR8su2y1VuUTtjx0GtzF7WTU0cQTqaGavu4MGcGc82gNc4WHBB3AWlRVdNl6iB6i7OWvRxlQwJRxZDFNC9lJVSau1TIunBAIVnSG7aTlilqM12xdFxGpTiCSfo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148099; c=relaxed/simple;
	bh=dlLCxPggdm2ny9n+veQWD3gfLZaXTPRSN8JKiQnvZl4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI0tC+HTnjxT/xlKDGqFAeHTXoDY/6/CZ3RCVB40wZ6aIcPL+1REInJEm6Nzf4KdkcugZDIhm+4yAVW6g5rKLipxUYai5LiFj4v1e2kePoVMa1dUihZNaIF6rpOMutFpKrXLUfK+Ck9EBzAtcEEXQbgDGquOhmm6bNROT5H66Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G+j1bJVu; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G+j1bJVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUZeKp+S88xwF9gtm8eXcFNP6FHcJWMWdZ+4VZQtjzdKVrLlOfc7IQY6/6QzDgDayGgGi6lruHNDUMuAM9uKCVTJIuAY7F33r8DeqeP9Kvr+T+2guuRqRg7w1cKFiuszWqJ6J3EUBH831W69XTJIGtixofXXx4pphfLV8dLjCezGGxEcAP2XNn+YKoN1k5XWNb9m0IVC10ZMUYK4Fy2QWMHjQaGmED2gAun9hAFgn4a8XUFj3ksLdKHpnsgLm0XOsddO0jWz67ej7GWWYlpqUj9K3hQLMnFlqLWEgqNH/EKhKVS6gUApH2FWOM5kl5pYwrSR4o71Go6y6xjj14iqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyF9pR7/hcyJdJ0no54umVSthr42PtDlPBBHdkFwk14=;
 b=s718T6Wb25cu7KiaRO6CX+SR+4PFKikWE8go4H1mPmWUNm/XhZ/4L9ZrdqdtSkEPCrreWq6APCNPxuKj12o6eQCg/En36ocuFullbyVEkilJZuN5R4KdkSBHlAifUup89QHOGhIxTV4DPyyQwO9ySisCamO9U0VxnRJqbkG3Z4xs/nTuhLL2je9g404C8XOSYQAbS0SDXMlHQXcYs3foxuu6m+mqGinnnI7GdfJPZL1ALRGLuOYHLfXBhFXOxS4+APvlkCuZT3wvquHW5DqOAHiIsiPHc+W5WNoMbzxR4JST3k+CXmGkvax9PriCVVG0bsPsKjCueBkWhGw+CPNabg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyF9pR7/hcyJdJ0no54umVSthr42PtDlPBBHdkFwk14=;
 b=G+j1bJVuAuWciZw7P5XAe8dQ8OXe59vWq5rI0nl6YARVOOiHpf5F9sbDRl5dXuS4ZSdHUaDlZKkvpy5soj6hzDFKQm93EvOS0kro0+0NojWlQgPDlHm0boBt6aLxIH1Y0bOLNKVel1s+xGTuTr2/XYmK1nEKsR3iLj04X9PevLI=
Received: from CH0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:610:77::15)
 by SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:48:07 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::a2) by CH0PR04CA0040.outlook.office365.com
 (2603:10b6:610:77::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 19:48:07 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 13:48:06 -0600
Date: Tue, 3 Feb 2026 20:48:00 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Bill Mills <bill.mills@linaro.org>, <virtio-comment@lists.linux.dev>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <aYJQ8HK2J1nGifEy@zapote>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260203081952-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260203081952-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SJ2PR12MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ef8d20-6e6b-4b67-9054-08de635d2706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KiXQ65qHYpLQSpa/sen+7pxCtKTbLvhvGoQrjmPgt6ZOO0Qdhi9xOGDhVoqI?=
 =?us-ascii?Q?AlZyN2TwIAk0GnLnbPdkwhEiAkRRcETxfkv2PJgQVE5dbj4PvFs9QvjKrTxc?=
 =?us-ascii?Q?UaEDcTlkgfA9SKuJALhedHrdFd1HySzdzkDgv+/iErL39WtJd3kMc+x8jPob?=
 =?us-ascii?Q?yDYKdoFRWZNx55prjnSoFhxcAO8cndK1TJiH0wRM81m5zTC4T/kBiiyDCxfN?=
 =?us-ascii?Q?nc5t4vaMLh7rlDqVqRr3yrlnyHLLMvDtHhE8Yv9Q7z2BTHjECcqWDpZgBiH+?=
 =?us-ascii?Q?T15tb72Wp9eZQ9JwWvLB/NRvWW0sTaIBsZk8VfzONc4tO+nqiHux5ycFg25U?=
 =?us-ascii?Q?MxOMZuigWpMWiNP3bHGsn1xsThNyCKoHbcWPJXajMK7H52x2q4M+xP4eeOjU?=
 =?us-ascii?Q?ktawmhm8ibQC9GP4oFEHbTIW/xC0GJJ/MwMPlGnQ2E0Ep/IDD9wRKPTA3zCA?=
 =?us-ascii?Q?suGnJ9+bvRuEM1ZiUrOy46S28a+UCUrfy6bC9rMgya4mHt1+NzcYrTv2AtCt?=
 =?us-ascii?Q?C/0kXVLj/b1kO/l3aE7ByQUrY4skuh36xeEIzr4byryX0RBOUJF1sRggvF/g?=
 =?us-ascii?Q?FgZ0hwSEER+kdWgFnT09edNiA5a4Dm0zQnXzl++35Q0pLtO0UqdXEgt4W0QG?=
 =?us-ascii?Q?efegg9hUsDR+Gutn0h18EotcZwFk4xeHW0wYAmhRIKffz3+fM5kS76MezSwG?=
 =?us-ascii?Q?EzaZw2D/Ps70bEiU2Om1gevvsWuzUBpJ+LCpWHkJf157r534elsefOtueUoc?=
 =?us-ascii?Q?qDL/KxluiY7Z/snfExaAYSqN5VT4vBRwcV5fTBJ0O7U2OkXCQeNQ30n1dGNh?=
 =?us-ascii?Q?GqrJXGpZtBVJsJAYP3o4xCyCHkII3a4W81VwqyMEkwPvIvIcbwQLyhEx709+?=
 =?us-ascii?Q?bWSZXM9LcEzmHj7rzccLFAZJ8BFn6VbtHj8AW/s2MznaA//Nkbl4tzQcOaQ7?=
 =?us-ascii?Q?yKQ5eTx5kHRI25dlk/trVhzAfP+GzEcjOzM2+OmL9leh9/XuJASggZFD1syV?=
 =?us-ascii?Q?IAUp12hQNlBmXaFKFRdiuQG5O/iUBEl/RpacfL6AsXyf867rr3MZRPhvsvsj?=
 =?us-ascii?Q?0k69v9k77f33kBKPkS5HDR4RU6pDvCDUkahFZyi7RgKSxnfVNsPhDaaVdWHx?=
 =?us-ascii?Q?pJoyaFhmHW+eUr6MSrWApU+ChtTCbv55LVMwvAjSGizbFy93tXK/B5iJukSB?=
 =?us-ascii?Q?H+aRL1kh0FtDoAfxYHPO+58bdpXYWcONGVFMo3b/B6bKC6UrRgEWy7la60Db?=
 =?us-ascii?Q?pmH4Sn2V5pjExIhFbs8TnGprbx5GZzIVLb3xMeuiyFW2nILTDC1Y8xoIFMjr?=
 =?us-ascii?Q?zQX6bVc8pHp89fjJJRMbesXmQJIdkkBsqkC+hHEE2K+6mRrl0GYubdwPcHR/?=
 =?us-ascii?Q?wkUlNYqj2a4XqlUW3jnhgwxigDgLfaQWzWBeqxZQnefTLI57llkvhGVh3nxh?=
 =?us-ascii?Q?xqp8Gey07QpIU2rc7zq4bT7yF0+SweoAQvKqujf4G6RpJaDTPvCSBFSqL2U2?=
 =?us-ascii?Q?+nZyx1o+3yJwnY2lzMuRlK1dycyxkfy09ifyFJu0DA5MSYqdKAWeI1XvmXnC?=
 =?us-ascii?Q?tFkRupAVFKozMxYVwPFr8Q/M+w8wXGA301S187O08iWOlvw9tAwy+6W25idz?=
 =?us-ascii?Q?WvBohyFTOVqKdtmJVRLg6Zk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0P2/WGEP/JlbQoNsTwKOuTFhVG1SsR0XHGfgudbvJHf0STMAptKJA5gDQodRu1wqbS4GAgN8Kf3eEawanHxNQQZW1StinI/jNXPCjlYV7a+BiPWxz1DVlOQjSSLsYANnxY/UI2FLRAcBDR8M7GJhYwavD8jGwshPUHYowbaHdrgH6AoN0qymPSg/rmO3BT2e7sZV6trofJRckE/1DlP8mIrDWK/P+vOyJl/m+JUnPdSiaTYzoudvQfb/KH4Zo6cGx1byi44fSHCNCNPKeFK7EwzkmYDnFQNIwcIWmdmf73UfN9Wt1DsqdoI312Jm9jcDdbT2LpXOiuOE+wRW+oww3B6T0+UVy+VVvVQ8pebEbAINCHR09ruiS7I95CB5Qun3OBlIlNyG8I8Y5GzNs6DbaxsjalV0iKwc7QutaFsT/xdhao0T5N+RlTbhmyKRmSAM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:48:07.0300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ef8d20-6e6b-4b67-9054-08de635d2706
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8876

On Tue, Feb 03, 2026 at 08:21:01AM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 26, 2026 at 11:32:26AM -0500, Bill Mills wrote:
> > This series adds the virtio-msg transport layer.
> > 
> > The individuals and organizations involved in this effort have had difficulty in
> > using the existing virtio-transports in various situations and desire to add one
> > more transport that performs its transport layer operations by sending and
> > receiving messages.
> 
> Is it arm and linaro, or more?
> If more, could we get some acks on list from the people involved?
> 
>

AMD is also involved, I've acked patches 1, 3, and 4 (patch 2 has my Signed-off-by).

Cheers,
Edgar



> > Implementations of virtio-msg will normally be done in multiple layers:
> > * common / device level
> > * bus level
> > 
> > The common / device level defines the messages exchanged between the driver
> > and a device. This common part should lead to a common driver holding most
> > of the virtio specifics and can be shared by all virtio-msg bus implementations.
> > The kernel implementation in [3] shows this separation. As with other transport
> > layers, virtio-msg should not require modifications to existing virtio device
> > implementations (virtio-net, virtio-blk etc). The common / device level is the
> > main focus of this version of the patch series.
> > 
> > The virtio-msg bus level implements the normal things a bus defines
> > (enumeration, dma operations, etc) but also implements the message send and
> > receive operations. A number of bus implementations are envisioned,
> > some of which will be reusable and general purpose. Other bus implementations
> > might be unique to a given situation, for example only used by a PCIe card
> > and its driver.
> > 
> > The standard bus messages are an effort to avoid different bus implementations
> > doing the same thing in different ways for no good reason. However the
> > different environments will require different things. Instead of trying to
> > anticipate all needs and provide something very abstract, we think
> > implementation specific messages will be needed at the bus level. Over time,
> > if we see similar messages across multiple bus implementations, we will move to
> > standardize a bus level message for that.
> > 
> > We are working on a few reusable bus implementations:
> > 
> > * virtio-msg-ffa based on Arm FF-A interface for use between:
> >   * normal world and secure world
> >   * host and VM or VM to VM
> >   * Can be used w/ or with out a hypervisor
> >   * Any Hypervisor that implements FF-A can be used
> >   * We have this working with pKVM and Xen
> >   * We have this working with Trusty and OP-TEE
> > 
> > * virtio-msg-amp for use between heterogenous systems
> >   * The main processors and its co-processors on an AMP SOC
> >   * Two or more systems connected via PCIe
> >   * Minimal requirements: bi-directional interrupts and
> >     at least one shared memory area
> >   * hvac-demo has 2 demos of this
> >   * This is working on two hardware platforms
> > 
> > * virtio-msg-loopback for userspace implemented devices
> >   * Allows user space to provide devices to its own kernel
> >   * This is similar to fuse, cuse or loopback block devices but for virtio
> >   * hvac-demo has a demo
> > 
> > We also anticipate a few more:
> > 
> > * virtio-msg-xen specific to Xen
> >   * Usable on any Xen system (including x86 where FF-A does not exist)
> >   * Using Xen events and page grants
> > 
> > * virtio-msg over admin virtqueues
> >   * This allows any virtio-pci device that supports admin virtqueues to also
> >     support a virtio-msg bus that supports sub devices
> >   * [We are looking for collaborators for this work]
> > 
> > Changes since RFC2:
> > 
> > Spec Functional:
> > * Made the common message header 8 bytes and added a token for optional use
> >   when parallel outstanding requests are possible
> > * Made the 8 byte fields align to 8 byte offsets.
> >   This effects the {SET,GET}_VQUEUE messages
> > * Many conformance cases have been tightened.
> > 
> > Spec Editorial:
> > * Major restructure to better align with virtio spec
> >   * Conformance model now matches other transports
> >   * Use C structures to define messages instead of tables
> > * Added a section to describe how responses are matched to requests
> >   This includes the use of the new token field
> > * Redefined / better described error handling between transport and bus
> >   layers to eliminate the need for the bus to generate fake response messages
> > * Included editorial feedback from RFC2
> > 
> > Eco-system:
> > * Added virtio-msg-loopback demo
> > * Arm has published the first draft of the virtio-msg over FFA spec [6]
> > * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
> >   secure world
> > * LKML RFC has been sent [7]
> > * QEMU RFC has been sent [8]
> > 
> > This is the first non-RFC patch series. The known short comings have been
> > addressed. We ask for review in earnest on this series and thank you for
> > any feedback you can provide.
> > 
> > Background info and work in progress implementations:
> > * HVAC project page with intro slides [1]
> > * HVAC demo repo w/ instructions in README.md [2]
> > * Kernel w/ virtio-msg common level and ffa support [3]
> > * QEMU w/ support for one form of virtio-msg-amp [4]
> > * Portable RTOS library w/ one form of virtio-msg-amp [5]
> > 
> > In addition to the QEMU system based demos in the hvac-demo repo, we also have
> > two hardware systems running:
> > * AMD x86 + AMD Arm Versal connected via PCIe
> > * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
> > 
> > Please note that although the demos work, a few have not been aligned
> > with this version of the spec.
> > 
> > [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> > [2] https://github.com/wmamills/hvac-demo
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
> > [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-rfc/
> > [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> > [6] https://documentation-service.arm.com/static/68f647791134f773ab3f0a7c
> > [7] https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linaro.org/
> > [8] https://mail.gnu.org/archive/html/qemu-devel/2025-10/msg07438.html
> > 
> > Bertrand Marquis (2):
> >   virtio-msg: add new command for bus normative
> >   virtio-msg: add conformance entries in conformance chapter
> > 
> > Bill Mills (2):
> >   virtio-msg: Add virtio-msg, a message based virtio transport layer
> >   virtio-msg: link virtio-msg content
> > 
> >  commands.tex      |    3 +-
> >  conformance.tex   |  105 ++-
> >  content.tex       |    1 +
> >  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1746 insertions(+), 3 deletions(-)
> >  create mode 100644 transport-msg.tex
> > 
> > -- 
> > 2.34.1
> > 
> 
