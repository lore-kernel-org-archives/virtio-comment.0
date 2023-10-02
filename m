Return-Path: <virtio-comment-return-7581-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FF0E7849A
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3DFC9330A0
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D4259866C4
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 22237983FE6; Mon,  2 Oct 2023 05:16:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1495E98669B
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Oct 2023 05:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhR4lmIHzSaxy2tCHWu/kkbOh9/Fl9Cfiz/ro8wnqtmoWc1XHXjBlgX2Oe8arILLM9+944VLBn9+XvZDIj7ptFWB1MEdTEBwhnwBtx77FNAxn0nMrF7iFsRFkAmpBYWYbOA3K1SjH71Y/Hf5a5nuozpM3aMYCweUgWiVclsGvVIb+0unn2xTlhEMu1s2uKiDQ090wyF6kj5SDvdvXQCyoZ9nAtnFzpG4paSsQNGeG31GJcvNiXTY+gG6BYLPG/bLJgiGMCTfAwv8lMIfaXmEI24d9L0QHgggv0VxBVknHPogTKTN7rPVozCqz6A9g/KeQX2oTbQeBoGXlP3aT49oWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSzESDru/wBFKt73UCnT15Zzm5RvQUNdUTd5SqG2aUE=;
 b=h1rRM6elV1tKG87PASrSFVLKFLKkTDv62ndHaL7YTxZ9nl6R9tsadJxNQHyOMNjT3HlOQWFYr+d0ofpdqI4z1QVw6XHPfW32U35hf3HXUMLDPBeEfhtJimwt33xECuo7UZ3BMsQsEziLzP5mKeVXjD3HAaJqkaXsthyVvAYHl4aWsB9djvsBJrtwfPJgLJOXHDg9RBRyGxyVvBYXUFKdXTtRwOWQQ1uTY76UizPjfvj4jfJ4wJ0CMfeeGW9N/B27RztT2HAN1carS4gxawB/wWhUhVIXCIXeA/klBBSHhGGhIc4S/Jd0mK2sxnY/XycVov3ejbTQWi3n+Ioc5ux1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Mon, 2 Oct 2023 08:16:00 +0300
Message-ID: <20231002051601.6626-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002051601.6626-1-parav@nvidia.com>
References: <20231002051601.6626-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: ce21a3c2-8779-40da-6251-08dbc306bdfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vq3Y9hodRJLJaeujAsFzNd3eyFHHyJwtT0mJQcddYEaq5/rZlEJNfLbCsEISwyMtEc8yFoDDxLOgEbIGTrqHh/988SYGGtEWeVIZpN5TvOh9J9bAMcrWpdagC9omWNeHDLtfL+qA1sJCXmMTeQWaFTXGnTK6nnH7vU0wJSf2gMUzHrXvlU7t0MSLMuzPJOrXq+G1RWyDMjY64/CANjkXKSNZnz5G7wn17+a0w0VgEyXXrO5Kxl0VpwzyuaJlmkpDbQukTXT4y30sOPZ2c5Zlib8QtBvmtlWyCf4af/A8bDEf9NewoPLNxKuKHdfnSX40Yjb/1OWepf0N17OrU2ew9+UosdVamQlxSUfBFSFAxQFsmouLNUdmaeHnRfZTuBHs94Xm+XABEIUstuam7ET5GPYEbV7jQqHc2nj9VDgVVTeCbcH8ZdczpUbIzJ3IXmXdJeJddTjo7cCI/rPb17hv2FZV8rKdv29nv/3Ob4Piyt3Myl8U6i/NKL7upWSpN8e1X7NZ/YUBdLuWITot7Ja+jIcCg0lHre/9TjAnLYzqw5dCkpCy1/x11gLpB0xS7Np/f5cRGHndH7/DaOuWntGwdVdeDCT/iBvx0x4wMmf8J6A7iiV+Xc55Rdfb/bQrg/y5j39eUd/Y6an/cqGcH72sAeM6Fg2MLI5xn9rO6dRlS4WLG2FZDxogcrGBFwKVPYj+bqvbQgAtQsbsXlPub44jmpIWz5l6yEmGCdjMRlCWUXxYanM8y/UO9H7nlHK5gY8Z
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(40470700004)(36840700001)(46966006)(107886003)(82740400003)(1076003)(40480700001)(40460700003)(2616005)(36756003)(6666004)(356005)(7636003)(426003)(336012)(83380400001)(16526019)(26005)(54906003)(70206006)(316002)(86362001)(36860700001)(110136005)(70586007)(5660300002)(2906002)(41300700001)(47076005)(8676002)(8936002)(4326008)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:16:32.5811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce21a3c2-8779-40da-6251-08dbc306bdfe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
Subject: [virtio-comment] [PATCH v3 1/2] conformance: Add missing virtqueue reset conformance references

Add the missing references to the virtqueue reset related conformance
requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 conformance.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index dc00e84..863f9c5 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
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

