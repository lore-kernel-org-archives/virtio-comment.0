Return-Path: <virtio-comment-return-7757-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D6CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 14:32:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3815745B25
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 14:32:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32011986887
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 14:32:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2986798686C; Tue, 17 Oct 2023 14:32:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19C3A986871
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbB+r2d5kQSpTFVNshpU7NVfmXgkkqgyi/iIwp9Ndn7jz0dAnoIp4+jttJG61pW1TIQjaGMhvPtZ+RDleG4sMsbjdMQ/glcPlgoIjTEwoA+NBIO7BfhRNp/eWCuRMkTCzy+jtIgF0GC5Dmp/8fzynxlMtZfWoiEA+t36EBiJs2kNfaKHBkEp/gjH2A4IMChfCBazk86RV1OocxT35uMjVp1mpY/fLZ2vSShnTxFcwOLAK07aNwEMJYgT4mDtFf/3V5Stc9COIp+ILkA1yu+QL16Lqgqs6xvc28eLlsLfNNhTWV0Wv+1C3hzBH6U7e2i0JfJ+khSKbFjHxBzAba9Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSzESDru/wBFKt73UCnT15Zzm5RvQUNdUTd5SqG2aUE=;
 b=Dkc1erEAAFaJ7s52H1ZZ9phhQd+XrUlnHgbpiLCKe9rLH96EnR56FBdyrLsOK1PNvrbLzQtNowqr9RXzzNZfE/5PQEl77mGNgvbazRyqjNUyCFz0vmvX8Nd/lxx42QWmIu+XP31joNvXDGDWpmEGHpR0TURi01rclhIpf/Y9EaXtsmbZGiArK6QxFAdBeSTfuLUw5cBnACm+wKmZM8XYhfxM6ol9hTE2Fa5h48A0fP3emdQOUHHW6TqnJaE9PPE082TdF1UNgEbE9TtpIczSvNmSoO+zJlHT5RVI1eFY3DiP9zuPKpHic42UXfsvaS/XnHMEfM7+1lIlGfDS7BwHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Tue, 17 Oct 2023 17:31:34 +0300
Message-ID: <20231017143135.758523-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017143135.758523-1-parav@nvidia.com>
References: <20231017143135.758523-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 02acd746-f31b-4903-f4d2-08dbcf1dd661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WBNjYvhXg8Cr5x8rCI5BFA/qX2AnyNMr11JcdzdtNcsZwgicKN6XVO5LsrO5pM1yr8FL3FEKz3nlFdSgCwUyuPTDMZ/YrkPoB6xlud6wngT+piykMyitc57NpUv8ew0lBAl7xLjkLHebZuSkxV1Ba5zoQ+RZ3vSekIWuRfkKPLa7BZCnoJfoKGJP6KaUpKYN0qh+AVW5/ZndY/MxX71qGhKmWeb7gJbxyEKnAyXLAFPE0HpTkTMvo2S1O4PH9tgRcKebh5youAJ7lWP6vksRg85RzESoYFUnFniBZEb1lWzQ+PfDjByNBVwGeN8L+hlipZT30orO3CnR20vehKHm0ef8WIEQQuPsZDzIMG6V3fkuSTRY8sLeakYP5kz8nQbOF2r4QXs4zQ7/SBHpxAVqZONtBpgMcJDIq4jFVP8ZtrckroSzyRRYfI+hrVGdWMSzEHKCmI4m8Q6ctJhWmVBO73m5CmuttHfFH4kRZhnRfj/VIfDUUKcASQwcUa+NA1CuVgfuE87slt9RbKhHSr3lKOQyk7n1O3HIe7NlQ85HDAd1EaVHnTTNzK8uitVK0l/QXnp6cUxkvg+RlVK+VxAubWVXddhv41XyJBbj0LioWlKC46JYOhOsDFWoy2YooodR9MOm/mn2ofeAc3k2pt9Fes9b2qI9At5ABkNNTen2J2X5e0IdjTiIaXBDj2ulg+WwqSE8d8BdhM6Vo2MHqBuhE2ZWj4FDmYprsvDXevxDb3HNCHey9caL394Ah2KHS47h
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(6666004)(2906002)(5660300002)(8676002)(4326008)(8936002)(41300700001)(70206006)(70586007)(54906003)(110136005)(316002)(40460700003)(478600001)(336012)(426003)(1076003)(2616005)(26005)(16526019)(83380400001)(40480700001)(47076005)(107886003)(36756003)(36860700001)(82740400003)(356005)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:32:05.9239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02acd746-f31b-4903-f4d2-08dbcf1dd661
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694
Subject: [virtio-comment] [PATCH v4 1/2] conformance: Add missing virtqueue reset conformance references

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

