Return-Path: <virtio-comment-return-7764-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D9CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2E996780C4
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 297059868B6
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1D158986882; Tue, 17 Oct 2023 20:07:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D82A986883
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js/23qDtkpSJWsRStiziSQFtVh7yJH/EiykSoYjSFRQ6Sb5OGfuKrWENXTzoNjlIeDs3faKS/as3y/1N2Lc2SOpmoohTUDpDC7QcFUuDYjfkZQfjOBgfqyI8OjZhsNNP8s1EgM8LWAL7OL3hh+6mYthOy6Q5JI+YeZs/h/WFTj5N7KWcKkzDwMrBrvlPShoXMln387nwy6O3if6uTkYiTmMoIVPoVZP7I57ZPOF+dTVTsI2wQXNWONNycRsNhO0BIAnOX30qzSjWmpYJXUzI+E5ReOXRxXMC5FqH1Zq8xb3UJKoEZCTMwd8xgkkwX18R90jTHF+DF1FuiPNshBw7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpR1oB/h6f/4jb8CuYnIC9Z0m0GWFxVXM4hCY32wR5Y=;
 b=UGg5VMMjoAwxyjhucyHQsvsQ4+GtgujKJkqInZb7cjczDMGLKlWLVocMxPmHtRuguxhurm/dtU6F1iBdAiO+BWly46ZWR6gkV7+/Z/uBKyJr6qtboGV3+A/Y1HAyZQOsFZAnzV4ay2BLensCTomVjT21atly2B9uWBeh53Y69p6YzYTU4UWqZLKOKsYwU90DW1DFSC+CwehshfJGBcRM9JohDGcgx7E7Hp8Q2HFk3alZBX4F8qR/xJRFBz1UdXZQVw5mX5MLtktvK/MKMCZCrHEpxpQ3yLhGx9DuxHUzVIA3kXjHhuqDuBH/4uujeP52Xz0TF0VD7B1wXlqS1KS3JA==
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
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Tue, 17 Oct 2023 23:06:39 +0300
Message-ID: <20231017200645.779222-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017200645.779222-1-parav@nvidia.com>
References: <20231017200645.779222-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e84034-fef7-42ef-d978-08dbcf4cadca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JVXUQxeAeA/QWdBoFs03POUVc/MzjHSJrKi+sML/EaHBDN8iiYprcPhL3GutwCRNngDrxmqQfbGFM8igCk2f92lBP/3htNuViSEZSo6KgVmLRQMC/u491KNrf4BqytrWuiw6FBxXLjdUTioys19VmruK/he1WEZzjfr1vl81gwjfCvv7/zWrGg1gUbZu1v2YU2PPyjC/z7LEHRIJGOkXcYpoQrjv6oVHMLvuZo9RyXCbKeBf5AeoKMnXEt++RzWqkoenwICUccmgYC+lTrnxR04X1brmE0EPbOBkscdnemPxg+7+nRNnsBw25Gf486PkXzrp6x6S4Lcn6iwUgcvA3W789zg4CiMCxypRIIa0aIlzm5MpHG1ABaLJBWDwjNPr9pKG3ZNp8qyNgSp3S5WyCWixIuZNJ3PpOo2kV4Hn6zFI1VZ0c+Yfv352CjZOJqg4J3oCrssVCTFscN88rTjTdwD3wYMa/90lw/K0Ie/+LSW2namiLSwvVXpxgkyJPR99xEUjHhLiG1YhCNPoqnq48xCOWdHICQ3dKGDyvU7AtWC0NxyOvQnBEvfMf6qdK/dl/ncDPppLmmp2GUc1+a9CRn/y84gE4sqoiPLULgz24neH2Hrc92cDPuTxY0bKv0yD/8l2XlJqBD7xow/fSHGPnVuyylPOlqNTTTHrE/4YhlXGauvm1RaLndu8gYObw6/o96NVaemXPIbTiiGaaQAQ/BkL3dZis44OTu21cwFeFqbbPKGyFNX5wXWbpubgM7fStswGyTfAV/MzYBXJgV/Vog==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(47076005)(36860700001)(478600001)(8676002)(16526019)(26005)(40460700003)(2616005)(7636003)(426003)(336012)(83380400001)(2906002)(5660300002)(8936002)(110136005)(41300700001)(6666004)(4326008)(86362001)(70586007)(54906003)(70206006)(316002)(966005)(36756003)(356005)(107886003)(82740400003)(1076003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:24.1398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e84034-fef7-42ef-d978-08dbcf4cadca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667
Subject: [virtio-comment] [PATCH v2 2/8] admin: Redefine reserved2 as command specific output

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

