Return-Path: <virtio-comment-return-8044-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420C7C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A509044546
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0A90986B58
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 982A4986B37; Mon, 30 Oct 2023 13:20:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A343986B4C
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzN3sih9tdKR7JPho5hnJcz78UyqKqcTf13JiUJJgZU2oCMIY9LxiYIuP31sbZzLfpirWmKQGLufEr1WZeoTFQLMblbUhZ8QFvRa8Np61Myt1sOhos2tl57y1DHudbhyulQ+OJGSpQntKCRRNNK9L3pSDG6CDaeZM1I/ATrEVcXImR8go4zG8P+1M9V3BNrqfv8fV3JGynoEYC1niMGuEM0uWcx4ZDqzmFcmgLWwWFGAJfsJhEH31PN0AbL9Aa0NvZAY69K/0nJUeW42oSFTSi2MUZydj3VRzZkGNYckVEPNL8BCzQZNO6tC/yZowmlUoTgjYvwTT5QSf/A4bAUSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpR1oB/h6f/4jb8CuYnIC9Z0m0GWFxVXM4hCY32wR5Y=;
 b=a4iL8fsEdasU/f/wM3ZF3RSd8JZfRNaILKCZYnKJaLG4Ea5utccEeeUpahEvvUi7nwpowZc+NJVlKHNiO2uCgpu/llWENVVzebPXeVllruul09h6KrUyIMS52hV1wVerff9Khfj/hkg6T9Qv1kpSmipNFY1vSJiHl9DoCj//XjwPq12h8KvwcRfvrUCzqBrFrxJ4pvcXAK5qBZUVO+kxEfrZ5m/YkK7zFhF7OxIh2iiy2CyJ5qJGHyjTHT2tX9cVIBuzgE0l8JdckIAfNICElIdB4crlWIMv2PpamMf807HV93FaDNVhSaO8ESR3EjNKf0vzjnEHfKRujhGaNwS5og==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Mon, 30 Oct 2023 15:19:53 +0200
Message-ID: <20231030131959.1386107-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030131959.1386107-1-parav@nvidia.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH7PR12MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a86176-cf68-451b-290e-08dbd94b02d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0cuHCHNz/X/b9MpebNorvisL1n+NTksbLQWAc6syMZf2JbzkfI7QnLRTk/rgKhHk0Q+FpicRK43nlrvYd06K2V2+FNjC8I7xX84n1qN4zsCsa6URb3XyfLmkRwDrCnKQYoN8lt2/QOluZz8a4GJHb/bNupt9CJHW22Wrr7uQNiJF/gFmjAYbwrXwJnlL29pYU/xjEPzhkwbD4zqNdtpeaxPzCCyKgLmXlW4cMUhFKpipalZBK8vr73Y/YZcW8XM1GIAGAPRPG5yGa+jyDI93eq5IZT068+OWMYxb9EnZsCKyhklb5mjkH92RnQY+wjElo7lcKFv+bmGEdk+FEhxBI2BPKeiCRqVZ/oIUtGOxaTqtGKoxqX8+bXuL6VvLRvrz/rJ3kHzVKPLtE7xsWeuCi95vFrZsOPoK3SnSO+3Tp5FTTwt2dC08MiHiq+qKZC7lIBNFGRC4gofC/ZjKRYxzdriWeF3ddHzjjLlfz4xKRDttWwTqHABLiMHZHwuFY7YB8/ECwcKastRPuIoi6n6illojdA8XsEhSzokgnx/A0UBJeGsCawnDg+ADnqtKx2bCJJZZccdFW330RlBUkh/ez5kI6W6raax100XC1iFPhu/0254YWfZu+z/eyDQfVe4YXEGLvSMlc77mIJQJmRhMbKU+ajcgd6oRWjG7E/1IffPykpMZlwm7Y5wgHzYA0Lsrfg6zQ1ee8ln0gQzfgPOwK0BBzKAd5vBXEewrk6ajbDKQ1fggpKRDITrMK/BHEOBkggi6h0mxYCuqk8t37g6Kig==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(86362001)(2906002)(41300700001)(4326008)(8676002)(8936002)(5660300002)(40460700003)(478600001)(36756003)(966005)(40480700001)(47076005)(6666004)(1076003)(107886003)(7636003)(54906003)(16526019)(110136005)(70206006)(26005)(426003)(336012)(70586007)(83380400001)(82740400003)(36860700001)(2616005)(316002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:39.4924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a86176-cf68-451b-290e-08dbd94b02d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8777
Subject: [virtio-comment] [PATCH v3 2/8] admin: Redefine reserved2 as command specific output

Currently when a command wants to get two distinct types of data in
the result, such as one consumed by the driver, other to be zero
copied to some user buffers, the driver needs to prepare an
extra descriptor for driver consumed field. When such a field is
<= 4 bytes, extra descriptor is an overhead.

virtio_admin_command already has 4B of reserved for the device
writable area. Utilize it to define as device writable output.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/admin.tex b/admin.tex
index 6eeef58..c86813d 100644
--- a/admin.tex
+++ b/admin.tex
@@ -90,8 +90,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
         /* Device-writable part */
         le16 status;
         le16 status_qualifier;
-        /* unused, reserved for future extensions */
-        u8 reserved2[4];
+        u8 command_specific_output[4];
         u8 command_specific_result[];
 };
 \end{lstlisting}
@@ -192,11 +191,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 \end{tabularx}
 
-Each command uses a different \field{command_specific_data} and
-\field{command_specific_result} structures and the length of
+Each command uses a different \field{command_specific_data},
+\field{command_specific_output} and
+\field{command_specific_result} fields. The length of
 \field{command_specific_data} and \field{command_specific_result}
-depends on these structures and is described separately or is
-implicit in the structure description.
+depends on the command and is described separately or is
+implicit in the structure description. The \field{command_specific_output}
+describes any command specific output which is up to 4 bytes size. The
+\field{command_specific_output} contain one or more command specific
+fields.
 
 Before sending any group administration commands to the device, the driver
 needs to communicate to the device which commands it is going to
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

