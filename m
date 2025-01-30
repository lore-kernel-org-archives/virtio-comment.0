Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C906784D34
	for <virtio-comment@lists.linux.dev>; Thu, 30 Jan 2025 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738260614; cv=fail; b=U2JOOu2cZfQH8PzeASE5RbZJqttY/oYZQHFDJirUdKOkhrPE5jGitFU5LPIxT132/D9M+VtWWWyNMGfqqCgsVghPotpiohNGFc4Adx7Es/NfDZwNxmPMYYu9KVn00r7hDdKAekwp6AiN9mvPoYebw5PtweltH0m023yYtsm3IC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738260614; c=relaxed/simple;
	bh=+GPR1HeUkswaqXt85M7VjRSURINCYnQhZPvu+jgVWS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=M5T+TSnebj8waorBDFe/B+kPxAuwRdH9z6dmhe03EcgQkRsmUAwUHV8gSyUGZTN1qa5ueXn53WXqYeyYMFdki3cj0EqVMMhJxixxGcZspGSJSUgev657brobws1TyC93M7g5NauE9/sdaeETboqx/b+xI1QiVIQlt95zVoOSCto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=cK3whefy; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="cK3whefy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDTNg+fEoCAI0t+1oN5hrgN5vCbC7USk/XgMzjOeLTp+d1M2OD4iBb0iyKshOErlnKo0BdAGMk4V+xzJ890lGpmls/34S+yC14/mIiXiPoVzIz6E8OYIIN3S3g7asmX945Qri6264KxfaK/4M0NyNZYmKPaCgHbxkWFSlaiKoydDg7D7w1TeR4Xrap2e7RQUzLlQLH2KvL5FSMCM+vYUF4WFSMFO6zf0+iJZt2BC+QUEMbP8JkllCJ9P0MHkskhXfAIxuQejs42khSZkGWMmdguv/FhVl39SfCQIwjqvlld91i25d35qodONFcsNwx5bvk3l9uCUR9YWb2yIIUKijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8+fq/XnrEGtLHMrk+nhm3JOcERfoKvaE8p3C2BYnlo=;
 b=aHFyIrtMTV5LI6Zc/0gXTjoOOVvGL1wH2fcCy0nIZBwCjOWzrYum4MYd3kZg1XD+H5mEH1sKS0pLAqXYEVz6+7NIfiedjRURB6COYQZKaMq57fR90/+SuP8hi5Hxl8uhT+mSb5066KhTzjxqqbLI8g/HNcLBEPsN3AD/Byn79V7BTR6fFstwpjsivFFAoOoJozohPqgalHAHu1RcXoedpzDszdJU2kPOBXKNBJBhfk+29hh5wNYHZ3rEI7WQyi+WVLYHIuUN8OKQWKdPsxKkTaBak7GBdh2Me6zbfAhOBG83zQl9Ou7pr7KQsgxSu4PN+NZyZN3UMpJfVRw3qRHZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=nokia-bell-labs.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8+fq/XnrEGtLHMrk+nhm3JOcERfoKvaE8p3C2BYnlo=;
 b=cK3whefyawQjCllzW8wfEphOh5/0CXD8Jp8CtM+ycmf312WOP2z+EGcp3Mh5inXoUkGYWMZUgRp4Ao3eTfIXf/Ahm5eOM2rVyxTv+W/4P00ks4d77ZpuiJRhRybV3d2xiD/zIGgNnUuo5S0uxxWcFoD3mNXCQ5SAP5cjKqg9MC/2NKKpU6iIkhi9yTF7NZwGNPSGCBDpEIz9sV2BrqNwuVxsHgIsMpg1NKlYH87JCw41+8d14Gwq6rnf3OjrN7DTvgGiMfmAcpagxQQDYVBbm5Ugwy1Ad/uyPpY0caVeUUsMuXw4bVlAJbQ3nh0TcJCd+wthDTqTULJOSpSPsccaEg==
Received: from AM6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::32)
 by AS8PR07MB7560.eurprd07.prod.outlook.com (2603:10a6:20b:2ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Thu, 30 Jan
 2025 18:10:07 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:209:8b:cafe::21) by AM6P191CA0019.outlook.office365.com
 (2603:10a6:209:8b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 18:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.100 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.100;
 helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 18:10:06 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr711usmtp2.zeu.alcatel-lucent.com (GMO) with ESMTP id 50UIA8fP031906;
	Thu, 30 Jan 2025 18:10:09 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, jasowang@redhat.com, mst@redhat.com,
        xuanzhuo@linux.alibaba.com, eperezma@redhat.com, ij@kernel.org,
        ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
        g.white@cablelabs.com, vidhi_goel@apple.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH 0/1] Proposed VirtIO spec change to fix ECN and add ACCECN
Date: Thu, 30 Jan 2025 19:09:59 +0100
Message-Id: <20250130181000.41973-1-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70A:EE_|AS8PR07MB7560:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e12618bf-af05-4b5f-7561-08dd415953bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZiT8dst9uRvm1OP6kjFQmT2vaSnEk48i0ZAPtTuEWmuH7jBo1FQ9tet6Ku7d?=
 =?us-ascii?Q?UB9u0xb5o2ok+NfCla+IZb9uwNHLB2LfeiWhgjWSazdbB8KlicfMg3RdjUvA?=
 =?us-ascii?Q?YuNpfQgCT0zLjM/PmwqVWtyT5PVSyiaIx1jSmGojJ/Oc9Bsg6stfcXZAV17W?=
 =?us-ascii?Q?paeJqqKuFqp7P7xj0HZLXmgccmQO+Y2NZTx9JWEH3Q4KJ8n5fc/p83R7VKdS?=
 =?us-ascii?Q?b90wbEEUBkr5PItdBFI7aCaLKmh2T/+sTSaq+DDMvufcMx86i9VQeZDOw1wW?=
 =?us-ascii?Q?hZakf0QUPmfxJioLc9l+zhu8bKOROfxvnbH21SdcHDE+qNj2NJQFzTeT0gpK?=
 =?us-ascii?Q?KLGUYrdASwwd2xqS9T+yiQ4XSWRNcFZ8Xd1qxBvjl4k+DQ1gCq5Wpr0WRUD/?=
 =?us-ascii?Q?BY6X1SxVzkt97Qo2cngrSoxMyuZoUAMIey9QpYfWaiWuxd818WhyNL749x+t?=
 =?us-ascii?Q?M/aP0H2jl2m+PViYytp2DjvLMbMCawF8h0y6BWthFWjd3dqE6xnC2BQcBpOl?=
 =?us-ascii?Q?rlKaF8zvlrHYjeWm2sDQutbbALBgF4YBgpSW7VeQq/kXf5DqrNbF3/lMtquB?=
 =?us-ascii?Q?DyBPJnNoHWDi+5xqtBia5vzaIhjpRUG4C2Gbe79mbYsyMMD3MDiF30hSUrw9?=
 =?us-ascii?Q?Vhl/CrHWuUlj3D5Ur6gpXpIZOGCYV1sZTrpboPQISnDkKL+nyOjiqf2nevAi?=
 =?us-ascii?Q?LnG4v5G42JXfR/+zwtoRNfxgS1yKPQ1E3/b9b7puqq14MJDh0l3TCZkc54Y6?=
 =?us-ascii?Q?VapXEr5gUWF7Du2co041zpH79luyGjRj4aOZX4vPsKX8r9w986wJ+IddEWaB?=
 =?us-ascii?Q?o1k3cGl/gK+gG/6iUb2pkP3ZDk5O8zyT0D264coxpwBnY30Mkf3Tcsp4EPjX?=
 =?us-ascii?Q?YxUXxOzLyXhwQlm4u0C+pMELFp4+9qk+KdbqLaV/QJ5c7NWX4gfFyn+/1Ebq?=
 =?us-ascii?Q?ZPi0+S4yqNXi1o6IvQjkSSMlf9MhGndDxnE1k9Az5oJdixFaEuav5eLIQhcF?=
 =?us-ascii?Q?0birqD6YO/k/TnH2OTUENOEGmmkoYKNihfr6BqQ0+zUVjALnDUFXXN2AybRD?=
 =?us-ascii?Q?8YC/dqqvw6J/7m9O74DqdSYnLRBtvgcuebjSwO0Xt0bxnDmwKl+tY109RB4a?=
 =?us-ascii?Q?wTCstxkqfmTjSM9airyHwdiZu1R5xawKMEGPEwZRj9BHFIqH4CTOcf7JvL2n?=
 =?us-ascii?Q?A904FCqklM++o8BYLYu2d4raq55Zsmv98Ve+dgCKAKzUStNjzAvVbgrXuhuV?=
 =?us-ascii?Q?2su0w58ccdfblmNCsPIrFdsLRTjJ6wvNKP29cuqfk0BD75DF7sdvX85tl46A?=
 =?us-ascii?Q?bt9klBZLTCcieVa4IPzP5Izo2JnRD2R0m563dtINYe2FW3xcAnewyO1l7jTP?=
 =?us-ascii?Q?fz5IpfiXXyiakmsZNc6i1f2UnPlxpuhFTzpZhVfpJoh69pRCUocXKwToEqqr?=
 =?us-ascii?Q?7lBfaqSP9RHnD0J7zhKsjlpZJ4CUa2La?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 18:10:06.2514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e12618bf-af05-4b5f-7561-08dd415953bc
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7560

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  As discussed in net-next email thread, the ACCECN patches is planned to be
upstreeamed (https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-30)
, and below are questions and proposals for the current VirtIO spec:

1. virtio-spec describes "VIRTIO_NET_HDR_GSO_ECN indicates that the  TCP packet
  has the ECN bit set", but the implementation uses SKB_GSO_TCP_ECN, which
  indicates that RFC 3168 ECN-aware TSO is applied (i.e., the CWR flag will
  only be kept on the 1st segment and will be cleared from the 2nd segment of a
  super-skb). So, we would like to request clarification and propose specification
  change.

2 In contrast to RFC3168 ECN, Accurate ECN (ACCECN) uses the CWR flag as part
  of the ACE field to count new packets with CE mark, and thus CWR flag shall
  not be cleared withint a super-skb. Therefore, new featue bits for host and
  guest are added for ACCECN feature negotiation between driver and device. Also,
  the implementation will add translation of Accurate ECN GSO flag between
  virtio_net_hdr and skb header by adding new NETIF_F_GSO_ACCECN flag.
  
3. After viewing current ECN-related implementation of virtio in Linux kernel,
  one question is about line 6691 of ./drivers/net/virtio_net.c:

  ``              if (virtio_has_feature(vdev, VIRTIO_NET_F_GSO)) {
                        dev->hw_features |= NETIF_F_TSO
                                | NETIF_F_TSO_ECN | NETIF_F_TSO6;
                }
  `` 
  
  And I would like to know why VIRTIO_NET_F_GSO implicitely indicates
  NETIF_F_TSO_ECN capability? As I was thinking whether ACCECN flag shall be 
  added as well.

  Thanks.

Brs,
Chia-Yu

Chia-Yu Chang (1):
  net/description.tex: New accurate ECN and fixed ECN in virtio-spec

 device-types/net/description.tex | 63 +++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 18 deletions(-)

-- 
2.34.1

