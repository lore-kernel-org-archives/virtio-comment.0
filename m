Return-Path: <virtio-comment-return-5530-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DCEC6FD18
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 01:47:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 67ABD42579
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 01:47:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3829998662F
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 01:47:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2BA6A986416; Wed, 19 Apr 2023 01:47:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1736B98667B;
	Wed, 19 Apr 2023 01:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkejJ6/uxi5RVWRaDWb3k5SV7fEiZ0a7HOw7M7PHw9WdjbMiKuGEUh49+vjjrHlKFbBzUVn5ORGeGVHUjkqf+5dIGO/Jyv/fHsxHktH4NNg49rJXfUL/jd/OnE5VrjWIA2ZwuJ1fvR/MFF+UqxZSMnuvZl2KVNPVSCHYfcSt0k0NlUFpMn4pH7d/d84qH2wE6otmhmwX7BNUatzZHpGPNThshVt5gZRSy/dt5IWcNze8pzevD74ei4+WeeQU1pdBY+NPnj5t47k+joe/RZKlX8ZogiqkwmA1/i04rAC+Ea0Co4MuotLFvaqne2W/2oumVk4i8NRMK+0jTDaCsAoQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIrKzNK0r8J0mYQY62yxj4x4aPPGtPcxoZR+7vQKVt0=;
 b=V+JROJElGWCsjaYWoswK91c8sAeVZyV2Nfrh0QWY0Kb5C5Pz1013fHoVRIMy4P3GnEgPtmKcMQgVUnSVE7xfUUfmnGGAnV8og0WYTyu5criax8iSc5QPj1vwQ1awMo6B85yQmZy41txfF5Xo2gDqmm2zQnypZBiJuN1SqIB2YYS1jcUnadZrY/iLe1bO2dZfaFpf4ydWwB084BEJvT3K9710cD4v14CDMYvlSMNtGTRwEU7iRDRrp8KErqqLxQwbxNLMUZ3ValdsyxqkK5+J5JMgRJ6agFFMFRzgfzR9Ud4pcMucp1Jd/7BV0G7bqWCKLzzCMMU2U3VjUmCbT3DH3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <mst@redhat.com>, <virtio-dev@lists.oasis-open.org>, <cohuck@redhat.com>
CC: <sgarzare@redhat.com>, <pasic@linux.ibm.com>,
	<virtio-comment@lists.oasis-open.org>, <shahafs@nvidia.com>, Parav Pandit
	<parav@nvidia.com>
Date: Wed, 19 Apr 2023 04:46:36 +0300
Message-ID: <20230419014639.919458-9-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230419014639.919458-1-parav@nvidia.com>
References: <20230419014639.919458-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f07184e-4a57-400b-fcf6-08db40780036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bHyLfEWSPopTlLQnaOS6dMkoi3dKYEKALZkDuqr/LzzijOUnxlnZrO3kpjDPPqKnTWW7ss6khC1Zduc9IZEefZ7jPaegDuWPAWsjNOiAKK//cq6mush1KZ9JufrQGEHaOqq1UH+znHfpTVwWFqd9VPT3TjhL3vH1JcMxO6dyjqUm5CFZiA6XwYlLcSZaA/V9QVKpwEhR+Tb7XiL30luea+RpadukBvcGkvIUormJ7FLZbh/hjLRQIJY5IUgpD/SJWO11f3hs+J1SL07DrkaTZg7tpF8tUvWQJam62j2gVbcGq8awXESkPfbU0r74OrFrHllu7TmtPFlnS7pg7AKssn3BE2M1bde9fkrWtQtlzMdokdw/BXu+DMFnezfLOUpC0aCyR2J7ZgqFPJVnT0W5wS9qRU+FTIOm4CGEB7NiL2Nrk4IXQZSwgd70yn+R3YIrUePQcH0RYDSuCdg+dpc6CyP2zQuDj9bIrkq4D1v6XK1IOkPgeXyQ9ui1AILM0Ml3061uMODN03yQOx1l/iA0FNPdOQfTKWZgCLcncXk3t22aLH6SxDnEQQ7IVU+GOcS7zjy5J+6qzE3Yj1VFPLAcQbJXiI7WGmpRNa47Sl473VGMi5Q2uir9GvMlgl7e0N0fO3FXKjESYnw/MXC14Rg/ZswyrkxYoqNLONb8pFBCfR90qgvND3THDu5llAzXsItVbNsxDgYgnd0EOMAkZhS1Bhlxb19dCcEe3sauUU+RRbk2E2KCv/aIiPoZwkSQF4QhUJphvfj0F93DY+aBzk4pdlGFQrxB+1Vt3wPuVcu3TbQ=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(6666004)(8676002)(70206006)(70586007)(8936002)(5660300002)(478600001)(41300700001)(40460700003)(186003)(110136005)(316002)(82740400003)(336012)(83380400001)(36756003)(54906003)(40480700001)(4326008)(426003)(16526019)(86362001)(26005)(356005)(1076003)(36860700001)(107886003)(2616005)(82310400005)(966005)(7636003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 01:47:14.4726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f07184e-4a57-400b-fcf6-08db40780036
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361
Subject: [virtio-comment] [PATCH v14 08/11] transport-ccw: Refer to the vq by its index

Currently specification uses virtqueue index and
number interchangeably to refer to the virtqueue.

Instead refer to it by its index.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/163
Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v11->v12:
- removed changes related to index
- replace number with index
- added 'only' to make it more clear that
  notification has only vq index
v9->v10:
- replaced queue_select with vqn
- used lower case letter for first word in comment
v8->v9:
- replaced 'named' with 'known'
- replaced 'queue number' with 'vq number'
v3->v4:
- moved note to comment
v2->v3:
- added comment note for queue_select similar to max_queue_size
v0->v1:
- new patch
---
 transport-ccw.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/transport-ccw.tex b/transport-ccw.tex
index cb476c7..86272d1 100644
--- a/transport-ccw.tex
+++ b/transport-ccw.tex
@@ -545,7 +545,7 @@ \subsubsection{Guest->Host Notification}\label{sec:Virtio Transport Options / Vi
 \end{tabular}
 
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
-the \field{Notification data} contains the Virtqueue number.
+the \field{Notification data} contains the virtqueue index.
 
 When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
 the value has the following format:
-- 
2.26.2


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

