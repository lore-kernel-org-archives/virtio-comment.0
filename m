Return-Path: <virtio-comment-return-9103-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F4C4829B
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B7D977806
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99F3498664C
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A6AB98649D; Sun, 11 Feb 2024 09:48:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63ECE986401
	for <virtio-comment@lists.oasis-open.org>; Sun, 11 Feb 2024 09:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVRYp+JporzG30YgenLznjViZBZoIbH9Ron/Ww2Q97yCNG6W3OjovrZqk7lwQfH+9wfeKRO+FJ2CPtHc4ynFnybnHEywvmvpUcae9jZLqNsCKDsaqhtJ2/Bv0l3hwL74q4mSxrUIJO26o7ACxDRV8NmvDV//dZj2YQa1+PiXaKfvkH7yXTVz2pFXawo5lI9+iRLPbSgKyQFXX12yGTTuXqOwnyqS/zhWGIZxLV2GCs4KDEDNnU88saNGM5h9cKOEvoUaOrzZnhriKeQ7p3Fo7cIkrmI5rUdJiD0lZA2f2EVKD+gagOTveXeZJW81YG/8SlfJRXhQA2EvHrOGWHVtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBAHGfYJpklY/BpEo52o3gx7OUurksdZuVWLRHOtKwY=;
 b=jKkpbzAH77tlbGgO/HbHuNrZJIfm2KDQGtl1a9HL2qovo4xVakm2Wo/mFuuf3BNawhzKtdBk0tXIxtNyGHoPKQed1dLUZh07RXSAJrOz3Jj6e56ETtx+97zezEMeil/UDT1YXY/ymYvtMDB5J4B4P/JP8bENfQ9GuGR5QToGiXqgywRcVcR4fRDNKZO83RjJeDpoPpqBP3VSqiJqQxZa1sA0BDIlE8ZXFoF/2sRBrp95Oc3LEW2slb/9SefO6XGpuj8h3xgsuXXBu21qtTjLIiNnqywV4fFBhIAn0bxYAQNbtWiXoPA0dm4cLQY9uCKELKaLE13mc2aLTezFxjBong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 11 Feb 2024 11:48:00 +0200
Message-ID: <20240211094800.5397-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240211094800.5397-1-parav@nvidia.com>
References: <20240211094800.5397-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|IA1PR12MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b1edf7-47b4-4d54-0808-08dc2ae69b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LfFHvo7Q6SzwDiLZK+fldWNEaMyG75sSjZlF11C7zfbWP7laUQ1QMzCxGW2oIrthKm3Z78KmsUqWWykYAhcZHl+rs9iQ40G/Sd+7byC7tP+E6ZIZWY7MQthszejMNKuMjqOy1K3fRKkXisGv5GQ0wCOEzFpBYKZRs8ksNGPu30ya4MIpnf7qOIE6l6gmAm7RlFGmEtzZpKE74vQxKPRLljG9ZF/3/IYKQYrTfP4Ea4GCQbHjd891Yy90/o32qB/IdLrcHSj3gNpoeTGMU25BHqV85wGsT9x4Hn+SZX+pj0O0q5CjneAsRa0ntThgXGIkvqHksyiubEXoHOR5yiUscgncdv6DVFfORzTOb6t9TeVhDsRpZWc44MUoDGDPnLRMYx43STV5hJD0WGbptqHrTmRKik0qxnNpuay6mqjfADmbgwBCj4XA1a1ptE6wFzyC52gN0yIYMM24uTte6yGAIoLLeZjCp4XyMwX82yPdY0TxA1vb8VuJXOXuttyhd5f40YZXDevf56mPqQykFB9CK3gNF407au+gHINTyskHa1MmBIIwyDWsn4+bqTIGv8Kg0KNHKY+Fxbz9K+Z1NL9fPXfR/MBqKD2U9mJZNmxavi4opgMNF29a3kcqo0xPtMJ+LhPiEYuSEdwdUpDtrngUiQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(86362001)(356005)(82740400003)(7636003)(426003)(478600001)(336012)(966005)(70206006)(110136005)(107886003)(54906003)(16526019)(1076003)(6666004)(316002)(2616005)(70586007)(26005)(36756003)(2906002)(4326008)(5660300002)(41300700001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 09:48:31.6885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b1edf7-47b4-4d54-0808-08dc2ae69b6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7685
Subject: [virtio-comment] [PATCH v4 2/2] virtio-net: Clarify the size of the struct virtio_net_hdr for tx

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
v2->v3:
- rephrase tx to refer to the rx side virtio_net_hdr consideration
- addressed comments from Xuan
- replaced 'field' with 'structure'
v0->v1:
- addressed comments from Xuan to rewrite tx normative
---
 device-types/net/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 17e33fa..0fd7833 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -528,6 +528,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 
+For the transmit packet buffer, the driver MUST use the size of the
+structure \field{struct virtio_net_hdr} same as the receive packet buffer.
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

