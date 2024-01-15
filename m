Return-Path: <virtio-comment-return-8927-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A9C47258
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A5E042B00E
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97CDA9867BA
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E6129863E1; Mon, 15 Jan 2024 09:32:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8073F986468
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 09:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQel8y+HsAaVHCyIu/6trciyk/uDC2nTjnbF4gM2OHjo4nhkEKTwDkcx/9EzminnHjNoX5ToarQacevmip06U3cHwT1+XTtuwQC+QB2Pc5VwUfBP7pAZNJ8u7ULNpcAqoXlrFBsrQ+aikKcEzkA82HBxYHg8B6/tG3aQZxPYwU5gaJGma8utqoABN2AeKhwa9qS/65TcwH5nuaIDHIqxiP3OCdlppItmETRhOHqEJzTIRxI+hPoXnVLw18ENuVAVf5Mg1iQKx2ujnZmeR0vxPpY5tlbiPmjzr0NKTeWa4c74FYyXIYXNKEnIP+iD5C+Q1mNx6NXGP+W1fn1Tm+MOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjCF0+X2ZSKhJJHDKuAGpV7gLnXRU8RxhXY35I/3Gbg=;
 b=LUQ270P0lsiSXRj6JJ0UYTr8tjl9XMXpfuVto1kBlsGotfIyrUugj8ygnW43FSoXtm7db0LXMJ+BcmverSkt0A8LdybaRhRB5jwnQFVwYW29i6saI4IYDo/usok0FsN54oSjx49RcuEYGaKIKKKOmxN44g0wGiKcRjgeVhG7inJtAi9jd0k/84xXPdAD+US2I1uCDgN/Miwz/HpFnJqD6suaZrNcqHVpikoE3K3El/CSeGscSvdUBj0nepZz3oum5YoPmUbMSpHo97fMOQcLdn/xkWHdnnqo3QZ58C71Nb5khC/F4MfLTngsNyM7WPxmuYruC4z8fDFDQ00C76Mfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Date: Mon, 15 Jan 2024 11:31:41 +0200
Message-ID: <20240115093141.3539316-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115093141.3539316-1-parav@nvidia.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|DS0PR12MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6330fd-d0db-4066-89e1-08dc15acdf34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qOH3VFfABl1T2kW5uF9xuVHosqm0JWt47VqjMP3Z1hpDsgpQhBb7hwr6dVsHxyqWPNQzsRVNxwpOQcrHnqJnjAOkRFM/QCmhq0oX2v0KtNV1Kb1oIyw4jDM6+1l5hkkBGWNPFdoJrSMovPP8klulpwurrXMwz+BYHQQdvQT+RZDvZjNtNDUCooo+s/iQfG+5j2x2qlkbGKJb/SJfBC5Hd+HtjDXvk7biyNfIO/4FxkAMRHRVRDY8TkkxQHxPsdGstXnIzFostWb5acym67yrveOnXzvxlEuEx1/rCX24SMDDNDwU7NljIVGDes83xPicJUK308mfqWDYrV2439FP4GjmUQsaemjDsuXN10gWVp/MkTUQ+QtZWvto45Iarmp5IWKVfSZKaT3CqARXCCZA2bMbsNN7KQPymrDLO168mV0FYfbBycDJ1KWf07d3yFXM1x/uKfR+HRBN1FN8CzvG5/sLB3d7IWLLME5gJhs6QNrydhQ9wO3ZX/xZBFMvBL2MQf2jN/Moq3OkqnT9hnce14Smx84LzUap5UO4mmsVo8qq5NbaJ7YdiLH36F0XQWfy1CkJJeNCwvvqZ3It7DD3hdPR4R+1oJWKvyHaJqe7vL8EUC5ctLcxGiy2HDASlc6nkyYvKgvD6m92Sli5CiNeCswKOLXMiVp9Zs7Ed0Up4ExV/0FB7zOFWRzJYP83wDvlI2lKcCsG8TACrwX/oi+MrZ+JgsepRE7s6GqMgAirppA+gozR2/IIKXzcTWD+x81Ivsk+IwG7AUiLnOT+TkS+1ByPyaazKFeq8YxNjswIKh4=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(7636003)(356005)(86362001)(966005)(478600001)(36756003)(16526019)(2616005)(426003)(26005)(336012)(107886003)(1076003)(36860700001)(82740400003)(6666004)(8936002)(8676002)(316002)(47076005)(4326008)(70586007)(70206006)(110136005)(41300700001)(54906003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 09:32:20.1057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6330fd-d0db-4066-89e1-08dc15acdf34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8294
Subject: [virtio-comment] [PATCH v2 2/2] virtio-net: Clarify the size of the struct virtio_net_hdr for tx

The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it was
not clarified that the size of the struct virtio_net_hdr on the packet
transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
negotiated.

Explicitly clarify this.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v0->v1:
- addressed comments from Xuan to rewrite tx normative
---
 device-types/net/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 53a56ee..e2de016 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -528,6 +528,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 
+The driver MUST use the same size of the field \field{struct virtio_net_hdr}
+for transmit and receive packet buffers.
+
 The driver MUST set \field{num_buffers} to zero.
 
 If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
-- 
2.34.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

