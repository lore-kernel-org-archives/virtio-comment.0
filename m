Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933FB27F759
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662284; cv=fail; b=VZ+M6XhMCCt6RhSEH82MKwGkffyPOnHKLld6r1tEHQ1H7RVKDIvvts0vL9Y3aacx/xByZ8iZBf91N42OLP3eNu9GGiPW3Kc8QXa9I+cyqwIfqhnt7n1FeyZZ47Awird4XGvk1DDyrxQkwp9RXGWpO4EFJgoIKbuAvU1VJt5cfE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662284; c=relaxed/simple;
	bh=5w2JZ1oGRCfPCxLNeEl6D50e5JyFaybiRN521zTRB+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PHo2nJKwvVDEp+iOfB6/CL1uTrZm2aiIe0oRfyhIsgvBQglP9kgiuXPDRU5KdCxBn2OCDFsvOFCBPBU+t3cZvj56CG30LejJm3rcSqXp/FbpEyfVmmv7+LF8Esr8CD7F8wmYq+K+mb9ij5kPYCZmKC7+3WxiuB8va3ayjKiazt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=IEGpRJXx; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="IEGpRJXx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAlP5WFZT/csDQ5qbmdm94bxETBpEj5M4BVM2l/lIgT42/nhWq6DGFqT5Xh4IAtOxrt57dkkKdR6kJQdyG7+lZ2w0o2jKb9GEixGGsrkJRPkJAtP9HV4g8pK4s6K3v153a7Y6ZIdv5scZ1RX+DzasECvEgBP8AP2kO5d/96J8WLQtrkG3milKhxDreP6ydsQygodlXSZfscoWw1T7p7Xyl1k8fumrw1Gnwk21q8+zCobDPJeplkO0WzDlgyw+k0c8n4kUhNhVi6yxpwuj3KZZPYrrD6oARaT5TUJkSpcp2K6fic2EwoCzYiSVckinQVUY5tJsMTvDtS7WwzCN+09rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CEEsgdgKL+f1Mzvm2TIIm12ZGDaiz4kfjCYKIM9mWY=;
 b=ZBvgo4eHm8XGS4sM84E5ag2HVdrYZmg6rlGVRuhMvxdZqacVKA69qfJDA1s2aIXllq1O953U7t20JOIDsEyiALS3CLXCeXW8nyXGWKGtPsE6OwCdFLpIxCS8oZE/jY+03P1z1FpT0Sv0Ug41W/hcJ4r2OILwTBQuP4uDasZuj+df7rinaeSLgjDP6b6u6Gdjm4hfRCnoVVe3m7+n2nW5pqCYFuTbtKAtXB6PrzYcuXENZ5SXAsY83HbBLIdXhtFQOBpTrzFdN45m1nlV5aW4tWYY1PCCf3aL60yyKTm/d8ASGbZbTtFzN1O0d4YRPdJF4lndnoOaUdQNNXjXWJbEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CEEsgdgKL+f1Mzvm2TIIm12ZGDaiz4kfjCYKIM9mWY=;
 b=IEGpRJXxb7fsT4huDfpVR8wexnPcyXDZMd9sPNSZnZfN9VQDFL+1qe6LJC6Pq+6cxl/TG+KWXXvCT2EUCX+eg4rasFVi10GL53S/vBkoAthz93mP8A1YUUaSqS45vhi8HuUmpReU65/SbqtMs//TBY2svFIaHjtaS0ELTR4SFuZ4LMGBxXA0XIG0sPduP7HSZcgsjIRrVAnfnWYPZlQZprE1Jm03ymyAox3tnzS/lqA9sqk0Jqi3uSKqYXgbjUcchgJwdeC9++VDJYkC3B3SzNsZJPamoGddbEqM4WPsJ3Ii384zMMbpD7g9jTmxUCySPhPA5Ui57HfqSJ9afEFOnA==
Received: from AS9PR06CA0440.eurprd06.prod.outlook.com (2603:10a6:20b:49e::35)
 by DB9PR07MB7740.eurprd07.prod.outlook.com (2603:10a6:10:26d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Mon, 19 May
 2025 13:44:37 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:49e:cafe::cc) by AS9PR06CA0440.outlook.office365.com
 (2603:10a6:20b:49e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Mon,
 19 May 2025 13:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.6.101) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 13:44:36 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 54JDiXAf011659;
	Mon, 19 May 2025 13:44:34 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v9 0/2] Update ECN and Add AccECN feature
Date: Mon, 19 May 2025 15:44:30 +0200
Message-Id: <20250519134432.27406-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|DB9PR07MB7740:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3290c3c6-6a2a-4db5-4f81-08dd96db4bae
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?uegUUheLOykQbYyOWchu+unRVeswMHvTAvvaQEm+12Yy3S32egVmq+KKVB2+?=
 =?us-ascii?Q?jVtFn2RWrxr6EpORcJQugW4AdzAOTdtJ0kt+QExIYKaJ2YbeqNippNv5dS7U?=
 =?us-ascii?Q?IrEJLyfBvhgMczheELfN0nsa8G03R5/vvIgSdOs9bJTvVRo10seViBEPWdOY?=
 =?us-ascii?Q?FNTq59PwRHTgGctyLqedEiIySxmvQTsWPnCIfM75h4LnLrZbkkEE7znx1xcW?=
 =?us-ascii?Q?AJglAUM5MIgrwkXCrlaFPwenHMGUokQ2rhrFG8VUf2QR/BGB1O3Sb8ar//5e?=
 =?us-ascii?Q?YxFVcvXQsZOoDze/S+4wVqWLaIViSy9D06HJlIgy5/QJRA8ISpq6sYQ+NPPk?=
 =?us-ascii?Q?7TO17F/E6Ni1sVxtvlbQL6J5rudID8rp3ugWfR1Ja5CbKiUEyq3mwxVJLOjy?=
 =?us-ascii?Q?2xtK4CzO6wuREpgF1FrTWKblvQbh9QnDyQSwMdcveV3hpozySLrNNwIwQTPX?=
 =?us-ascii?Q?jhbs//4i30mxrKq2HdHqKT10sJiTxiPF427pCuKcAZcD+8OfjEwKLt6mRlRL?=
 =?us-ascii?Q?EM/TrJH6DCt2DwWlMrULH/PpqVMJKbOpvN2jJVzudb7Sq5QBHOpjwastdT73?=
 =?us-ascii?Q?zjIFX7uS++a1G8hUT5vXxf3Y7MMpILgth+nYaQ4YQsFYhEWGFZPzB55lKkqz?=
 =?us-ascii?Q?lSY12KsQm4d8y7KgAZfavpRPqrDWZ+4Su7ozSDdP2EHdOqOpEsXaJOZmr4pr?=
 =?us-ascii?Q?aP1XhRvniM33JotI7Pln70AusTua8dl95b0PlaJcla3KdgvKKdffkZhoAosW?=
 =?us-ascii?Q?rEvTta0N8Z7Nfm7OSmAmoNr0edllNol4pt7fjbvbCkVdlfLeiyaqQ/otArcH?=
 =?us-ascii?Q?YUJYLGZmhZafih4FST1plC11C83LWn3qlrqp+oVLNhAwq+5D7ZDK+u2uxpWC?=
 =?us-ascii?Q?QQane1pbTcoPx406lu4i8+PsSEehWN8IlHlTqRhUORTHhqs12THwkeICkqsl?=
 =?us-ascii?Q?z4Fp18mRLzqj9qeH5F16Mn99tMW/WhsnsfMBlU4bI6CXXqyNovOmc42DdbhP?=
 =?us-ascii?Q?d330M2EnZMeG/nufdmaNVDPxCI7Y2RdGkpckrXisosfR8m5fsEGptU27vxjH?=
 =?us-ascii?Q?PVWzFAaVpm28brDtzXORmpZF4I7YEI120MFN2+QNzawETsjgk4VG6ujk67Kn?=
 =?us-ascii?Q?SBpWaa4Q++DIFo1yKXoVMwobtShf/m7HSd6HgDvk1BLPHAXwrxnk9l2MgweC?=
 =?us-ascii?Q?2lBLzdodPUS1AcfLPXPvyoPUuHhfF8oGRj7PqdiW0iXrRTeaKeOXD3Ofzu2V?=
 =?us-ascii?Q?+Ww3dV1mM0s8GQj0fhNAz38VnXP4uDGaUJpaP9AsXpqcPRoDbIFlH0VEKUAH?=
 =?us-ascii?Q?jxzQOLQCbXmX+C1jVq0wClOiSfEwSRi+5tgad2B1eeDg9PZq3vBWptYJ8awP?=
 =?us-ascii?Q?e7G/hycPDRLYpY/9OpXILNZPVTm6lMdI7rVPEGD7QqZ21gFiuoPmWk6X4DAy?=
 =?us-ascii?Q?cPU8dPBFoL4UHJ8sTyy86MBwqRc3ypf0YD4CR80IR+iIdR+hWHMNV18W9Yys?=
 =?us-ascii?Q?9Ujpx9wd72g7Yz3XbC6Ic3Zt3bQGZNEgyWn6ikWo+06q6BTXHkOV7f3cpw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 13:44:36.7005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3290c3c6-6a2a-4db5-4f81-08dd96db4bae
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7740

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

  Please find ECN and AccECN patch v9:

v9 (19-May-2025)
- Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@redhat.com>)
- Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin <mst@redhat.com>)

v8 (17-Apr-2025)
- Further typo fixing

v7 (15-Apr-2025)
- Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)

v6 (14-Apr-2025)
- Shrink descriptions and make more reference to RFC3168 ECN and AccECN

v5 (06-Mar-2025)
- Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUEST_ACCECN(70)

v4 (05-Mar-2025)
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3 (21-Feb-2025)
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2 (17-Feb-2025)
- Rebase the patch on top of v1.4 virtio-spec

Best Regards,
Chia-Yu

Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descriptions
  virtio-net: Define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 84 +++++++++++++++++++++++---------
 introduction.tex                 |  6 +++
 2 files changed, 66 insertions(+), 24 deletions(-)

-- 
2.34.1

