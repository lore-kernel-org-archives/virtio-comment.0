Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010062.outbound.protection.outlook.com [40.93.198.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4E2773F0
	for <virtio-comment@lists.linux.dev>; Wed,  4 Mar 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640095; cv=fail; b=KUdDAh9O3UsAdIDQr6amCXfNMuxOtvqmcMSV97gUN+udfJJQALlZp4b69PxFYDsLoxqKCtWPkW2El2zj2zOYXvrV+YbbiF5yrG8hU9WWdAo2TrH+JbQJQYSs984lZOfWs58F9+jFZDeXtVskRyjPrAV/luTwIEHBqyqwh0yR4fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640095; c=relaxed/simple;
	bh=44jYXrTJdEBk3rHE//Lw5tF/qoIDT0i6+6ERpcjTYD0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6NS/uXvIiyovIcHHyK+GOTMFQ9zbpxq5FPM8LyUrb+IYltofWPmXv14gLU3LHRa4c3LcumExWtMqRkn9zee4dEWKaTiUZ6Gj/yogRhTAbGTl6ZJZNw3cnECr/YZDheGphdjniOQf6qBoFEkI9Eiqn7yn5rylO1eUO7fGX1gi54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2SHTvysW reason="signature verification failed"; arc=fail smtp.client-ip=40.93.198.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2SHTvysW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdkqSpBVce8KrkS+wJgC+Bh2SG+Txy3KlN66mSbmzBuhAKdbc3SEa34DiOaK3JWi/YokofrSv8hgF0pr4UTkaOpkM+53a1Y0+7vkIBtVH4S+DDech10Oc2XNqZWICM54ia3a4mc9OZhwtLvAy0e6F+1wh95fusEDIJhH5uXvLuiVWFGuOBy4yoi9pZ9AnoDH2eSGkXm0LBUDrXinBZ1U+5P+sFUQGXzPj04KRxX5LGrsub+ZbFcMmYQ40F38+vpH1LNiBHRYCGklWfd9oNpUaASH4AxSKl3jLMHFgtJitnIopmCJA0gqp/FRTfCMmkMfJkYuAbmFNOeEQtwVA5OYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18V8Fh+khCJilcUTu/WMXqASjhHS7hIgfso4hw51sII=;
 b=YSf4i3z8e7qplZogNjjUqWRcK0/ZMXOjtY2jI/TWADn4r3EkdFivbqIxhL3VQWe48cZlUSaKJbbP2VlbCrZTRNwLII0F2AqdAhq3MQ2r+BdnabAQdSNremZSn8REpRUhJ023cQMhfCXYdDAppiQeawenMrlfyRHLdf3s6I1f6wnkA7y7Te69PtWBbOtvEuPGyvdFoMpBm6JbC3qMxnGWtoSEn2XSsKBuxK/BLYtOlHPyPaL9igxtDeR7UOmXiH2WuD6fWJaRihlL5jHJ71cIexfhmqGGZIIVLc30zRoDR4PFQjuS0V8dlJjF5L59xbLFxN1SeSfQmY52dkxmZT8s+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18V8Fh+khCJilcUTu/WMXqASjhHS7hIgfso4hw51sII=;
 b=2SHTvysW1xe0WyGdiLbjLN1egePH5Sa2Y/swlhNI6LyZC+4fh5UpmE8nfdSTxHa4QmjpdfK4ujLQXA0wMw1z32D1iRzZjNpX53ENS6JN4DJcrZj9sF41GFpSsoletjeOpaW+UOOanQSNRIqU5huV63d6N+6iQQH9nbZq09irL44=
Received: from BN9PR03CA0615.namprd03.prod.outlook.com (2603:10b6:408:106::20)
 by DS7PR12MB6310.namprd12.prod.outlook.com (2603:10b6:8:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:01:28 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::f) by BN9PR03CA0615.outlook.office365.com
 (2603:10b6:408:106::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 16:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 16:01:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 10:01:24 -0600
Date: Wed, 4 Mar 2026 17:01:19 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Alyssa Ross <hi@alyssa.is>, Bo Chen <bchen@crusoe.ai>, Rob Bradford
	<rbradford@meta.com>, Wei Liu <liuwe@microsoft.com>, Sebastien Boeuf
	<seb@rivosinc.com>, <qemu-devel@nongnu.org>, <dev@lists.cloudhypervisor.org>,
	Spectrum OS Development <devel@spectrum-os.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau
	<marcandre.lureau@redhat.com>, <virtio-comment@lists.linux.dev>
Subject: Re: virtio-msg inter-VM transport vs virtio-vhost-user
Message-ID: <aahV1M_mdXr1EW9W@zapote>
References: <b291c8af-58ee-46e4-9033-e681ff9677db@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b291c8af-58ee-46e4-9033-e681ff9677db@gmail.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: be420ef1-cc3e-4f57-e529-08de7a074b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	7Mc3rgH+vMegnTAC/T05Re/40f5qpTEsdKENLycLzWiIIhrQmZfrafi9Jz422C7Ya+mdX31z6CzU+1JejTLPcFnUjkwJf/FIH2zOdJQ3CVy0jbYWdNKGeFoxovMYUGwR6BdTkZOz1pHddvNCRN38GvCeEd3qo3iPOJRZLbSp9OuVrAO35WC/AVDP4KUMXWpJAjyean34VHrWZmcfrDZHETsb34YAExZF+LzxQidDjxiwG8GUp1N1i9aWJwwM9KryHxsNU0MFgin/Ny8k9kKSwEqvajg9HCQKED6aR+PKFKTUl1d/xhhYXIIKwdBWJaNuTWVS80Z186u4zrBioHP0rqKUdjCjmmw91BqCBDiGjhPOiccrNXvV85xYKIbHfxWu8TAhyOxVfnCVP1GdRbI72UIOcXRYnDnwKwJQV9vtC0Ui+m+uHCfP4lfs71ga7tBdHtmgwaFvQggyjTH0sMWRKUznjzNg9xweAxkkXadCDfEl44Y5TCx2lsa2FhYgo8/4n7JuPty/V0xKMNXs2jqtM+tDa7829AXpbIyApckEJUj2fAGmbgJtDejiTOGG/D8cVUHrriyesmbAbP9qvOW0qOYqCDO9kdCMmaRSuR0yikkSwK7pYCG2SE7FDB3meScffo2nOxShDusxViv4gAecdGKNd2BRTgvCrVfSe4u04OlBpuSxMzlqfLHe38JS+IVeu/NxhoLGhwyJFFNDu/IynQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rebx48edpJhC1GaHPXy/YvEqY83uMHfPT9a29lA+tNpkazyTGEF+rWtJYB9ZDWL9W08qwJofhyWklf0R6ud9Ht05qe3oIvKB0PP9vL5/lM1kzDwDWBfUO4RUuX5ES4lLdbjAK3Zy/gNRHD6+7Sy4059A3iCt6glsNZbNTOzVCSy4j+ZcZwnBzwkXmxdoTOpEBFexEmPJ+86YHRvZwgMboiLzxdvhb/ztszjJ+6Z28u0TxPWf7hooxBMhqUlUdVHjN5Vpy9QyQbpT9y49YKofpLqDSEApObXB6EzUq0/FD3oQM71Jm/UqlSGl64R58BQTG8XxcmM4OBL6/LVvCMWgUFfv4skkdiOesGIT42lXFQKkyxECfWXL2Jp+kgeOBuhph0+b49bbUlfnMRNxTv4cXuFMfeW2OvgB0+3U8sNTivlbWMILFMSL+NMHST2ZUH4O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:01:27.7115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be420ef1-cc3e-4f57-e529-08de7a074b28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310

On Tue, Mar 03, 2026 at 12:56:46PM -0500, Demi Marie Obenour wrote:
> Spectrum (https://spectrum-os.org) is going to be implementing
> virtio devices outside of the host.  One proposed method of doing
> this is virtio-vhost-user, which is a virtio device that allows a
> VM to expose a vhost-user device to another VM.  For instance, one
> could assign a NIC to one VM and have it provide a vhost-user-net
> device for use by a different VM.
> 
> I brought this up on the KVM/QEMU community call today.  Alex Bennée
> recommended using virtio-msg instead.  However, I have a few concerns
> with this:
> 
> 1. Virtio-msg buses are specific to a given hypervisor or (in the
>    case of FF-A) to a given CPU architecture.  None of the current
>    buses support KVM on platforms other than Arm64.  Therefore,
>    a brand-new bus would be needed.

Hi Demi,

The virtio-msg AMP PCI bus works on KVM both for ARM and x86 and
any other arch, it's generic. These are the patches we posted to
qemu-devel:

https://lore.kernel.org/qemu-devel/20260224155721.612314-1-edgar.iglesias@gmail.com/


> 
> 2. Virtio-msg requires not-yet-upstream drivers in both the frontend
>    (the VM using the device) and the backend (the VM providing the
>    device).  Vhost-user uses any of the existing transports, such as
>    PCI or MMIO.  This means that upstream drivers can be used in the
>    frontend, and also enables supports for Windows and other guests
>    that lack support for virtio-msg.

Fair point, a bit of chicken and egg...

> 
> 3. Vhost-user is already widely deployed, so frontend implementations
>    are quite well tested.  A KVM-specific virtio-msg transport would
>    serve only one purpose: driver VMs (with assigned devices) on
>    non-Arm64 platforms.  This is a quite niche use-case.  Therefore,
>    I'm concerned that the needed frontend code will be poorly tested
>    and bitrot.
> 
> Manos Pitsidianakis stated that vhost-user does not make sense in
> this case.  Why is that?  Would it make sense to use virtio-msg
> between VMM and its VM, and expose a vhost-user device to the
> outside world?  What about having the virtio-vhost-user guest driver
> emulate a virtio-msg transport, so that it can be used with any device
> implementation supporting virtio-msg?
> 
> I would greatly appreciate any and all suggestions here.  This is a
> serious project that is going to be used in production, but I want
> to ensure that the design is the best possible.

I've not looked in detail at virtio-vhost-user but it seems to be
a bit similar to virtio-msg over PCI AMP with some differences.

My take is:
vhost-user is an interface designed for splitting virtio transport
from virtio device backend in user-space on the same OS instance.
The virtio-vhost-user device, enables the use of vhost-user across
VM's streching vhost-user's intended use. This is a great step but
Since vhost-user is not a virtio transport, It is not end-to-end in
the sense that you need QEMU to translate virtio-pci to vhost-user and
tunnel it over the virtio-vhost-user device to the backend.

Virtio-msg is from the start a transport meant to work between
heterogenous systems, different OS, OS instances even different
SoCs. It's end-to-end in the sense that if you have a front-end
driver in the front-end VM with an appropriate virtio-msg bus you can
talk directly with the backend without intermediate proxies,
potentially without VM exits.

Cheers,
Edgar
