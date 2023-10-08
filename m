Return-Path: <virtio-comment-return-7612-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B263E95A82
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B8B847410B
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A44239865E0
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9B3F49864AD; Sun,  8 Oct 2023 11:26:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B7B09864AF
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLHCLBsBw1Ye7giOV9wIwKhfUMhUF60njzdo5p0dyysWMLmP/9Q3mVooMVwABhrSrTitBOF6QngZrpCgTEQicnlti2U+EtGfQmxsETdwGqdgBlaA1fw4NR1iST+VA72Zl13bGYfX9xpY36OEjP7+TlYOGcAy9kgJHYRry+O6K14tHGDadY4vHLIFwXYC9oecwGVzkMld2luobZQyiSwRUNtfy064qO4kLXV0alWFAs9NK4o7UbaNaIFxfnZ2T42j1MX3GwLiE63rtF3qz1n9UXWJdPfVkTTkL2AfqHkfwOXaC8pOqL94dhxChFNkrAvf/Hg4qlVx/l4YkAFNKnmjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpR1oB/h6f/4jb8CuYnIC9Z0m0GWFxVXM4hCY32wR5Y=;
 b=bknX7Q7DllAkZs0D4txExkeolG7KW03SZzbOS7MspA8iI6vt9swiE/jtyrGvzL5K0yAbWUexDg3ylIO8eUIox9g1aCTTcSpbt+i5BAZhEYEYactCgu4OPrtrtl7sMxLeeIRsWpo7XOI96hcRIpn5jgRJ7gugx30Jnr5s5YfK7rohNE3yZnrdmZn8KtctY34qcAshCMtZvXAwZ4BmsPShUwkp8xqIinCJVEX5ni7IjPP/DEIndfiEZw/5AtBWZ44XnJJVCQ0l9Ige4kxtWR28XS+G2C5JgzFdK0om0a9tt9iQys3WTWhF6nqwV+2dkhyz2VUDdx0AA3C8Pfk94TlARw==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 8 Oct 2023 14:25:49 +0300
Message-ID: <20231008112555.473895-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008112555.473895-1-parav@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cee9b3-a89e-48da-4246-08dbc7f1682e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dQWmPSorufVj84r0NPU4DoRiIbw5XlWuhq4RNy/JyDbXWTZKFIycleQxri/PY7IQZZkrYjFd3/eJHX1HHWAkybKrU/yXvzNMkp1XW6XRKOLrR3FTfunXi9oR+hnBxlVcU6FP/KfqU3Mpuq96hst/ehmP5FXRPMY7Vyo/M6bn1feIqRtVofalk05McD6U9uenC+HOOr6dEPHonuwulOPklOPNCeUHkHYhO3dht/yvG/heN1t+hiy6JNc5EoxrEavzlfxTBJf/fjhBBDpJebl6rD4Gd2xFGLrymskvpNvu/Y9QX8gRch/we1hURKRpta6G0WH7lQpRH8CDdExEtW5Yyo41zoXhXZjpsooThxyPPpE9ElgqXLlaL661nbgifW4oUtQM+lQ+Y7yCRmyXBZ0s/QgoIr80hN3C6eX0Fp5Or8BRy+UtxCVfOeDqIOY2eiwWKWC3+mRWK59yBWPULftsjrLSHpTpzy1c0zneKRovSLCGV5mZOjoclqZNNr7vRtc2hoQw3aew4J6KH7fpJkqJc0AAHxrEStuX+BL6AHHGH4HB6cZZJGojRejFxD2zAoO2fd0MCaDAUPniBoiykz05pLX9sDQSMAKXv+4uQLU/elzrRzC07rpnqLi2a4afUCsfN1L7PMAFFampCb78dlS17tufCFIelVqhKjtwyZJ+PEnKY8vGidVstB0TviJcugnzO+y0xxga0yT8WFOnPaVSrKdPV3djo0vlzH+PoXEc5msNMV2EDcM05CuKfmbVpx/FZapH/d8fvfAwJ+zq1zE5Yw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(40470700004)(36840700001)(46966006)(6666004)(41300700001)(8936002)(8676002)(4326008)(426003)(336012)(966005)(26005)(107886003)(1076003)(2616005)(83380400001)(16526019)(478600001)(47076005)(36860700001)(40480700001)(70206006)(54906003)(70586007)(110136005)(316002)(7636003)(82740400003)(356005)(2906002)(86362001)(40460700003)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:25.0558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cee9b3-a89e-48da-4246-08dbc7f1682e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628
Subject: [virtio-comment] [PATCH v1 2/8] admin: Redefine reserved2 as command specific output

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

