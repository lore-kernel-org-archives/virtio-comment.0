Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E090122A1D3
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813405; cv=fail; b=BpbN1obczKjdggyQlPwLvlsakHog76OHtTUxxi3vEyCJt3MKIc6dRYKEMZIC/I8w8PJ4OxxZM4RtX6ZycS532PrqH14vKcPl/FrawYAtVYKoJh1if/uLEQgNXGyConRD5saiqyn27RdgEpgwTxfiBF31VO2M2+fBz8Lv94s2ww8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813405; c=relaxed/simple;
	bh=Jpgi+7T0ykpRdh9OjLGDSX2LL7WiiEYIdT4I2qsYbl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=t8uGs3ESvM38/8ctswqGw2qnQCwNV8yfXS6yHnY15eYvFaY1wrc1Kckx1/vSPXTvECxSmuNSY1sRvy4RMuaFWavtPsbFo8kWUWRMOejWTIxbeIbsXy5jUXjgk5YucYu+KoDyoe0+c7hZlBFwtFH3fG8aEOj/PxRWLnTPRgOuqtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=X4sSA+J5; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="X4sSA+J5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9fygCgA7d3clAic7nJZoMWWog80jLUIAuZfRkkI/ISj/NYMg1pDcpFg66x7ihvb99jZl2VIXFxG6nUhNPclLRpEnDiFQAHqMdlWTJj1dBAlWHUDyfcMcoT0LYBo3opp75n+dhHACDauERxjQc2uOvZ/sKtXNhwDEQAF2bZfD8FA03/bCD4P1MTO/3LcI36ocH21g/kwD5nqPFSOV3+izZLlfordkSHP+UTtqDDGN7ExHgi+rb6S2VGZoRxvOdrNYjhFDft5nJxwvHIy1jgsAD12cjOWbn7i3JV+R+JcwfwJg0PCWYB3FiyqaCyg4+b14qsCy3/uXvYRxPkPdipaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HM1MspRAc5YWS3Rf9J96z7s4lkICPnc2Aol3N6FopME=;
 b=Nfm25DA0onR7aqZEaUJZZ+jdu8IgrG/KC1pc1ZG7ciRTCfaATBRFDZLt3bJNS5cjK8YEFQVykL6v08+VZjaZLvLRYs/wfwquxSgND+1+vG0E/cuEt75//8rFi97bMxcqLx0d/CbNyyLsjvvXyVJFir4bgFhuhCkdvryP89C0VI7yuOCq1RXCi3gifkBHVeDIdxcbdWf5XuEvoJXOKHyFKcYfFhWlzv8e6BP+HctuC5jhd0ScNhmn4O6LZBqtWXW6SP7BNFAIFt8wh0A9FA6Rkp7hkfEZX3IqiKira965xWoW5Zm4g0tP+3mn5rAwCAiYjJXCsMPK9Scq5vvKC5hDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.20) smtp.rcpttodomain=apple.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM1MspRAc5YWS3Rf9J96z7s4lkICPnc2Aol3N6FopME=;
 b=X4sSA+J5VigHvQFN5bnyH/CXo6HLArtFTaFcvEr1fAAWNE7vXGQFlgjlaccoCBzNnSeLaDtKBT5PgiL2ckSawPu8faSRTt6BjVXfIocAkoJvAx6kE2uOdpGU5WKVtQslJZhAVqTaGnaaY2Sp+Gjry7KRXtNyYF3uUFLwtuL9XStKXepdG2aun+jrj52vCAZEQVoiG1dG+GjTuB2hxEfhJjOKXif+YOyy0mKzaX44/dt7lihpfEYuFEAmx6v9nxM5aLWpdwVhzN2Ko67yh2V5+O4US4TExd8lRFuiYn8RWZYQAy72c53uG7spr1liUQJuMXvbzUDPyWq1CbnVa6MyZg==
Received: from AM5PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::27)
 by PAWPR07MB9321.eurprd07.prod.outlook.com (2603:10a6:102:2e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 17:29:59 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:206:2:cafe::6f) by AM5PR1001CA0014.outlook.office365.com
 (2603:10a6:206:2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Mon,
 17 Feb 2025 17:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.2.20) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.2 via
 Frontend Transport; Mon, 17 Feb 2025 17:29:57 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id CFE0F200AC;
	Mon, 17 Feb 2025 19:29:56 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	vidhi_goel@apple.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v2 0/1] Add Accurate ECN and fix ECN in VirtIO spec
Date: Mon, 17 Feb 2025 18:29:54 +0100
Message-Id: <20250217172955.9271-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|PAWPR07MB9321:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28ddae97-edc7-4ca8-c8af-08dd4f78b332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kMd7LNjDjIFjNHVnWEhouuuXmsa2hsmFgn/wrU8CLuQfmJHY7V1T5zYeWQZr?=
 =?us-ascii?Q?0I3mFLTLqPnNYwbeqvkAf2IMP2/9fMR+pgs97oeC3wvBreTo/w5ElTMqp2p8?=
 =?us-ascii?Q?YYA4OrVEpDOWoGM/BFF2G7PMXR8u0vGbHHzS60Nn8X5w+f2L1kL52lsSgee3?=
 =?us-ascii?Q?yH0and/JWtPlcFjtFyOBtMKlnCl0nL/kUdHoT69HWzlBE6349IGIGa9+P+03?=
 =?us-ascii?Q?ktSRvz7UTU+TC25LI7dWAdBCptffmqYALGQvssqq5lFjCuVwKUj/qXkw/u7k?=
 =?us-ascii?Q?/3o3KemuBrCalOb5+D699augp9MQrqQzrAvFGiXCeHFPhdeZnLZlcl98COQZ?=
 =?us-ascii?Q?W+bUEFJSwLRawwQFSbzUrRt60Dgvhb1ezk8R74WByi7yGtki7CVkMIEAUiNl?=
 =?us-ascii?Q?SpbiJqh3FzKELF1+deeoQ1fvjRqJIRpwAQWYBxPshlD/6E15PVkuT1HcdZFD?=
 =?us-ascii?Q?f3mPkjDRs/FteCgvleLgHcvToQIvtZgM6jN8qMrU89Ui59TS8KHTHMCuYdGY?=
 =?us-ascii?Q?u6ihtWKNr5uHmRcLGyP6qqTZ+j6tluSGbEpXhI74yIxbIWtvCzf19QJeeyT8?=
 =?us-ascii?Q?a9YVJNp5BANEwUl5HJd3+k7xAMdmu++FV4E2zQJpTbGsBTvCKZKw8RNCiiT/?=
 =?us-ascii?Q?sy/H6lfSXmVcIKOqngAlQhdcf0sg0lP29AQ9k5pNURjMjNIXYtRNlif0lpny?=
 =?us-ascii?Q?NjZL3RxOPlL15aqCOZ1Cywz2GP6dkpqbjZKtjAgDGIZapQ2IrEtS57eRbRN5?=
 =?us-ascii?Q?AC+S8aE5/7wkCJ5szuncxPiGMgE7UttNjM8BlNkEG8OnS0Gb4QdbBC3DhTIU?=
 =?us-ascii?Q?J4I2lC8YyEj/Z6MlGFJV1w7Dzr0zX0GtR+agoA4CH3C5RPPtzG650fofLa/V?=
 =?us-ascii?Q?WrtJwcgOevB7GUKN31S8oRLk+X6k54adNxAIcbi8EtJxgh2BbrROB2SLJk5j?=
 =?us-ascii?Q?nTHmcBr11eAaBNAF5FXteDzj1D9f2RaD1vvNmTAlNJyQQxEHshWq5AEEhVUd?=
 =?us-ascii?Q?8fAxKrJ/HOnjwHjZlf70QujU3k5ToBnZt6rCai+yFl8g4liNbLBdVAhJJJlC?=
 =?us-ascii?Q?GFF48NB1zpOi1XBIDxjZyNUlzY2Rr1Kc238PGQQvP22BEDpKak+F8GeqWBs8?=
 =?us-ascii?Q?EBOUw7jT+54ZUnpNrvgIFJbrdnDMWwlW3KK/9nO+rcYrtNKBazng6CmkHQhq?=
 =?us-ascii?Q?RfWMebTZrzpiIZ076uTDyW7/EiM2Mp2aKIZf1kbZPH2uTwpATAhAHwmD41tb?=
 =?us-ascii?Q?qivNhFIfX38PlbkycX7+EHnQFCidpLez+HEU+MSdNgrc8tEw5anMUMQECFVu?=
 =?us-ascii?Q?9RE6SLqYB9hcRCSmA7Hhq7XrXAds5USD6JFEsPBnYLmyAMm5fLJ6RuLdKa3q?=
 =?us-ascii?Q?QOSX00yaHwV1YT7pLVtWL2gpcSDVUIItyYfuw4dOKMuT57pEO7BQ1KHLEJm5?=
 =?us-ascii?Q?seh90iuIZa4jCx8CLthuM/bMR4iSk6kPclOuG09Ye2BLNbGLr17GMOq2htyp?=
 =?us-ascii?Q?oicNv8C5RUKCVux5yoElfzQkH2jx98x3cI4+?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:29:57.6660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ddae97-edc7-4ca8-c8af-08dd4f78b332
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9321

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  As discussed in net-next email thread, the ACCECN patches is planned to be
upstreeamed (https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-30)
, and below are questions and proposals for the current VirtIO spec:

1. virtio-spec describes "VIRTIO_NET_HDR_GSO_ECN indicates that the TCP packet
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
  one question is in ./drivers/net/virtio_net.c:
  
  ``              if (virtio_has_feature(vdev, VIRTIO_NET_F_GSO)) {
                        dev->hw_features |= NETIF_F_TSO
                                | NETIF_F_TSO_ECN | NETIF_F_TSO6;
                }               
  ``
  
  And I would like to know why VIRTIO_NET_F_GSO implicitely indicates
  NETIF_F_TSO_ECN capability? As I was thinking whether ACCECN flag shall be
  addedd as well.

  Thanks.

Best Regards,
Chia-Yu

--
Notes:
    v2:
    - Add wording change of VIRTIO_NET_F_HOST_ACCECN and
      VIRTIO_NET_F_GUEST_ACCECN which were unclear in last patch.

Chia-Yu Chang (1):
  net/description.tex: New Accurate ECN and fixed ECN in virtio-spec

 device-types/net/description.tex | 75 +++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 15 deletions(-)

-- 
2.34.1

