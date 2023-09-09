Return-Path: <virtio-comment-return-7291-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C066AEEB58C
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3111812F60F
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E49D98667B
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 165BE98662A; Sat,  9 Sep 2023 14:29:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09187986633
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzzfZQCN6CtGlUAWVMg+zl1QKYm//9vwhNZEDiRNqp4CkLea+Jv+/b8BDbNF2YhdxDWQm5I46foMU29MIqZPa+WKRyGrPg0KmbA65G4L5MeI+Yo6RdRORmOBz/Ik1fdL0YfU72r10jH8FzaRAuwGgcAWrmw8v2l1HgWVtotGQ+fPEp7EmPteOwE71+GZa8phZjQSINNy56t+NNoVfv12EGOpOhMrrvwKngRNWUWBwUMUOTcL/B/67+iIyD1fPIOK2Uhxx5RuhrRe8wWecp6MtRrbrVXzHLiZuIjDrvQa126hf7u/T0+YaDNJ5LuYBT/fOGZmkNEP2bik6ka6YDHmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3InjFbVySC5oPvD6TcrsqJ2yHhil0bBzNSbKIZpFCUg=;
 b=lj9EyW2oPoC8Me6frLEJcJ0psDiDXLM6KVYCKqiHQTEfnMR9iPfAhCpvV/Qyrqs6fQG0XSC+5dWvnd83L0SzqbHIuNysVFNRtHAeri+2SI6eUSSsJsSoOJ5ZD/UPk/ukjFKNUfGl8CTfqZysu3oZmZPf2MuGuHgMpfRU71wrzMtlaQBrK+Hvs4gRsDDmk3hBTwuCANHpiNlnSZMd0cyo9h7Bzq7uNOigdypVdP4228Zrja2muf+FxdEW7/tkXBALfowWy0nWSMrs8nQ471C09sH1QrJ6cWFGxRr8PQ4q8M/fapum7dpZFfPvo7f7m/XBHopSbOle76ZUC3o2xdng2Q==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sat, 9 Sep 2023 17:29:05 +0300
Message-ID: <20230909142911.524407-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909142911.524407-1-parav@nvidia.com>
References: <20230909142911.524407-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SA0PR12MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 232142db-3ee0-47c2-d0ba-08dbb14134dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AfY2rp8baLD1dt48PNUF22Yr3/DeBTk6q0T9DjEbIONJn+b02tC4LrH6lfcnIpJeEOHIibDsDzEgAMOGvZGyyNOhW3dvRFbRPGPZVx/dgJTPGxp1r5KassPQPurvcPV/sFAUbtqWtrGWxorxblKTduRSBY96fb04pBVKh15+d+a8vbbzjEGtf6Ec9Pc2qOtaVVqs0DjkOvJ6nW6UWpK1hC62VT8MXS4vIs5zIyK4w8L9HNFYIsPYr+s9lSV/Wlb73yKbFNKnfsS/tW9zRXD1+xA3dpHgx4Cs1SWfgTBRCx2IsD4lLPFxykjlcZcvr5FBYo/4sykp921FPXXha/YJHErHqxHvkxE1Uznc2V13qaPs/hrscfCZg9VNJKqnffydXv4bSD7oq9ycv+TFP4Vj8A1oZFIM1RQ67TBLTzrWkYT2L1Qj4amBT3p9NLAyH6xNARMn5D/qiH4i2TNUiYIiBuIeZj5X5hc55aFg4Y94UVzE9/HkJxYZOXDvdVZzBwGR6MbGAmrSWU9LtnFjHMctHSlnFH/Fs1+kzmTBIl+TuqkQlx0EdjStRSepNelPph6q7mrRiEdB7OOZ0YnmXUTXa1Zlr3kTf8EbPYVYIsPpgJFY7vuX3rdXyrL5Fj1UUaj0eftNVdFcEk7rZ+zyZdyCqKp6ToI3JguaeXFaz0WVtPOvVJY+7+trx0ZGmjRw6zqO5VQaT3CVYaVoAlelGJPZlfRmU0g6e4ebf0fUtt0mRxzHImVMg0IjyGAm38WntuNk
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400011)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(6666004)(83380400001)(356005)(82740400003)(7636003)(86362001)(36860700001)(47076005)(36756003)(2616005)(426003)(336012)(107886003)(1076003)(40480700001)(26005)(16526019)(316002)(41300700001)(2906002)(8676002)(4326008)(70586007)(54906003)(8936002)(70206006)(110136005)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:29:41.9593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232142db-3ee0-47c2-d0ba-08dbb14134dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4590
Subject: [virtio-comment] [PATCH 2/8] admin: Redefine reserved2 as command specific output

Currently when a command wants to get two distinct types of data in
the result, such as one consumed by the driver, other to be zero
copied to some user buffers, the driver needs to prepare an
extra descriptor for driver consumed field. When such a field is
<= 4 bytes, extra descriptor is an overhead.

virtio_admin_command already has 4B of reserved for the device
writable area. Utilize it to define as device writable output.

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

