Return-Path: <virtio-comment-return-8945-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40BCC47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 44A4E26A36
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F9439867BD
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 23CD698669B; Tue, 16 Jan 2024 05:43:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15C4C98666F
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 05:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OobrLtC/7qJUqkgsJVdr7k7IRjgQQZWmziveOWA+NvAsW0xIeENCNuI8Fw0wi1u2LNMFIdqevlxvGgXQTfNEFGUWAq5ql9F+kHLxL6UU31Cswts9Dr8HBdIpghHovPplOYu9/4Px5c5NWhwKpfZORhoSoMdGzqt9Cfz3inVSCdizxJVuVB3P9bFiSgXdPdZE6l9qiwrxX72NiSHJOr/2+bZLTC8oPHOCauq1aO6uV9riecP7dgYDs9dHDvO5dZqsx1gELPG0npqDY2uK4WH7p4QCxNFVblMW4fQb2YA8xEzlKddxWWD4vZJ1hXZMNMBofj4SC651/gkT3jGSo3ZktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAvx8kPRBaVGR/UNCsksie0tyeFkqELAzJRPVKOhbdM=;
 b=e8i4hfrzZmlJTAH9MiAtDZ/9RZi4uoeWwq5k8xn47ttTL7co0A3//5Rt+obyUvHrNbv3aDk2Q7uWDD+j53KEUGUmACC+dlLFx37V1cXjWoOA2ktNf305hglMQGOxXf25AOI5QQqtGPFvnwK7GKHOMtaCgUZjefrvcxcBlTPmvEDDZYF6XEfF0tEQukGCxC7FFAeh27yPco3gqsAzRXYUdMZzWN9zbR4uMeJylAG7ERXdT66h4h1mU5nFaoL6/Z1qPe2ayy5W2W0EDZZdUq0RkHDDQ5L2Io2uE3+RsecMXU2ebjX+5XeS9b9pL9rE/iSm1uJVxRvWGfcUT0sDuTr2UA==
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
Date: Tue, 16 Jan 2024 07:42:36 +0200
Message-ID: <20240116054236.3546213-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116054236.3546213-1-parav@nvidia.com>
References: <20240116054236.3546213-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|BL0PR12MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 778d8435-9566-4c10-8e8b-08dc165606f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ykm+rwrULYQFeuMPZomGKL2TjvJktvXLApmPd7Vs5XsWcCCJSuJpQBr4DLYCit7goPX50Pz7IrlNMqVEDJ9F37O8eX9JKFMNmGPlSrXVapNuZZezG0pppt3CO4UrQ0yDM45Q4+QtqmRLq13oAQfN3YakyMtJBdjGcCiOLEfKQa4DFE7xQRPHLjWTXxB1BY8Nb/HuL4jnyIof4IULNteKNEcZY5NcGfdcwoqEa3ZzRW+9We3perTZsFOgEakKaoHKzJ0fS7YXb/Lx90aGcuH6wHXMTFQVlYWyMzbEHo/31WPbDUEjMi9lXE+MYClaeYWCakYbLqZGCZR5Gabvk80OSgkhAvJ2amoVoXEGerVyWlUo3UH7404IBPbXO5Id0/yVN36J5pWjbemjlVfDjJ+6Odcvwg6JLgb5PtskdAiRsAbo4TOPWQ+DzNa+akY3Rw3m1TNP31Z2I8TYSciArasBq9IY3koal+61DKjBISGB6Yniiw8ljIxlQXeEmgrZd19RzCZwFnEj7/J9QAAt6QvNfhYS4FUXC5nhbqBiVnqG/E3yqA1nuDI+Dn1lkFj0pWkmfFnt1qv+VrdGjyrbd8D2/K1x9pIEeiF1w74j7cs2J+Aq3mkax0CW7B19vg27FBuJ8f+Ghbh6qZs/Vs3QNK/EgskvOXLn6Z6DB+OGhMWpeGpMXeeVfRGu32OBzr1Nfcv28q/ZGJSs3zPOrU+yAkx2Bk1kxfC/cmePVUUc3DhY/9Hpi10r+Uvfavi4c8GpDg4gkhyotuiffaDMLg07tViNsrYE7y4Jye4CoX/SJKCSD2g=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(40470700004)(36840700001)(46966006)(70206006)(70586007)(16526019)(107886003)(426003)(26005)(2616005)(336012)(36756003)(1076003)(6666004)(7636003)(86362001)(82740400003)(36860700001)(356005)(41300700001)(47076005)(966005)(478600001)(4326008)(40460700003)(40480700001)(2906002)(316002)(5660300002)(54906003)(110136005)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 05:43:11.7229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778d8435-9566-4c10-8e8b-08dc165606f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4866
Subject: [virtio-comment] [PATCH v3 2/2] virtio-net: Clarify the size of the struct virtio_net_hdr for tx

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
index 3e75c92..294fa62 100644
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

