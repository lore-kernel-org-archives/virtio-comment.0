Return-Path: <virtio-comment-return-7455-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073DBCD13D2
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:35:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 534B3190907
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:35:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D297986466
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:35:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1ABCC98640C; Mon, 18 Sep 2023 17:35:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B31098640D
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 17:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqKxyHx0KkG+9EKwvfawFli1KMLKlYkN3H50i8OQSIwnD3Zwf6BYL3AWIgfQT78dL9cY8FhViSELVOJObM/DK/NBLTO78Uq7VkaWtAIPT/p42OGv0pwl+eue80TrDlbX25sO37NfCldIqFcJE/2FGd4o/Ra9HcS09BywVF+RReIO6IRppRbZPfrojg1NmJqbeoCLzTMfGE2ZAp+DMKamG8+cN23EBPNxZY/4t98mPjwo5MU50LWbTa6Tpow507kb41Bpwi2O7Z0KCGggYS8+SLiRWnxMKz9TJoUDHSmiibnqze77RcrKDDm+Ila+hAR/NKulru6qshxaJ0yMdu6DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsfevNSiqAnq0wzx28KDUCRToL8+4IYMTR6f2/3/ySk=;
 b=QHfnMq2YDS6bJYbDLZDY720epkN4XMVCsuo6eqBLE0E2BUfjw+6FRD9zRsw0DmjxFFVTIdJZJdAWCPkEiRYJENVGWhjoHZ9uMGP02I77hLOM54Oo+Qu5Qq0hpphiskGGZN54VLn9F7hsU36S/qvzasmsIRkDssO6loJhA948rm+uc4qX4pu/I49kqmWeF58i3Yso27phimMJ6ywJhGv95A2bzZYxsa2me4fVpcvo4zsv/QqFYl0rvRAlDD2CPbGakDseoHLckjgah1bbW44mqiKcrHndexlXaJknyS0dNMYmj1yaR0X8iLJkhpdb6TlSBVjQbdLSE0K7fIdVkpbDWA==
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
Date: Mon, 18 Sep 2023 20:35:16 +0300
Message-ID: <20230918173518.15900-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: b38fe1e6-5b53-402d-4e64-08dbb86db2ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NVkaaYX1+dpUwE9J+4mdGrnZ/NkAAH+CrxwcKBQuoRk6l/EZBNTV63rh1EEENU6WBWhtk99dYQgK9Z2A5c8+3civCkugkC9/RfWNI/lRZM87lOC43xx9NxKhyF2MUjf954ygKq+jPR9/Usgm4VITPTCFL+d/YhMHRhU2+pDsFruvdnFIXZkFApZ0O81jBMOt7hGiOc+l7R3JjeIo5KaO0KXWH83us4OyW+wpPN7/33GrE8UtjcLJpZOqsDslb++zHLSX9HsJ5fcp2cW0fo1wR0iDSdQEGrpnhiIOvBpLqOANXJDW4FJ7ivC1TQNrpMC7YJja2fy6gRsoIgkmq4WqRdJ6wVf1pFxyzMhd64UoGqh1nxcHGhnDLQwVo4wUJ+LQnZusra8ArLptSvVaf+N3+diz0+5HxB+38/xsF8YuqlpuoPc15BmLndgdg3V55t3Ia3BSaOXgXNX8e/uFSJCaln8uy24cUDeWU1fLGn0tXIx55MUjFo5VlkpnBCnqj+oDPjsnEm6thRnBHxXLl8HhpB2e49z9FnDLkfviiWoztvy9ArNq+Q35sp3X0VOjF+e3UsFwl3qnX88Ll7S+oNOkJi8dATing/6odsqX2WXzDFDdn8olu9DncFV8Q3PF6NvSX/JgGTNnk2h3lC/8POLFOxUwXYIYEaU6UmLAnHIyYh5VMcdZ/xm0Jh8BzNKaEL39fBhZ1rzcR3DxDYQJcGkICjdHFi2FpmbBOUhHo4q+/DIvUzfZeoAMkKxAJ1NcI3eu/1eGICOvoqULWwE8Vprtc55BVvuELINtza4MV0xaAGjODhX/yC5XakO2nNmFm5GT
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40460700003)(70206006)(70586007)(36860700001)(54906003)(47076005)(82740400003)(316002)(8936002)(8676002)(4326008)(356005)(41300700001)(7636003)(478600001)(6666004)(966005)(83380400001)(110136005)(2616005)(107886003)(26005)(426003)(16526019)(1076003)(336012)(86362001)(2906002)(5660300002)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 17:35:49.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38fe1e6-5b53-402d-4e64-08dbb86db2ce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
Subject: [virtio-comment] [PATCH v2 0/2] Support enabling virtqueue after DRIVER_OK

Summary:
========
This patch enables driver to create virtqueues after DRIVER_OK
status bit is set.

This patch take the inspiration from the thread [2] with credits to
Eugenio PÃrez.

Details:
========
Currently, a virtqueue must be enabled before driver has set the
DRIVER_OK status bit.

spec citation to section "Driver Requirements: Device Initialization"

"Perform device-specific setup, including discovery of virtqueues
for the device, optional per-bus setup, reading and possibly writing
the device’s virtio configuration space, and population of virtqueues."

This implies that a virtqueue must be enabled before reaching the
DRIVER_OK stage. There was no explicit mention about ability to
enable the virtqueue after DRIVER_OK stage.

In following usecases, creating a virtqueue after DRIVER_OK phase is
desired.

Use cases:
=========
1. Dynamically create aq when administrative commands to be used.
ate the net device tx/rxq when device is
   opened when deploying for a container.
   In a container, number of virtqueues to be used may be <= max queues.
3. Dynamically create flow filter queues of netdevice when
   ARFS or ethtool filters are enabled as listed in [1].
4. Dynamically create rtc functionality related read virtqueue only
   when net device when timestamping to be used.
5. When XDP program is set, one can create additional XDP specific
   queues without affecting existing queues.

Hence, This patch introduces an existing queue enable and disable
(aka reset) facility and a new feature bit to explicitly indicate such
support by the device.

With this feature, drivers can skip optional queues creation during
driver init time. For example, a Linux net device driver
can create/destroy the transmit and receive queues when net device's
ndo_open() and ndo_stop() callbacks are invoked respectively.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00097.html

Patch summary:
==============
patch-1 fixes to add virtqueue reset conformance references
patch-2 adds VIRTIO_F_RING_DYNAMIC feature bit, requirements

Please review.

---
changelog:
v1->v2:
- fixed comments from Michael
- reduced device and driver normatives (simplified)
- replace 'a virtqueue' to 'the virtqueues'
- reworded to remove 'interested'
- avoided repeated 'device initialization text', replaced with
  DRIVER_OK status bit language
- avoided confusing text around 'MAY' in the requirements
- replaced 'the queue' to 'specific virtqueues'
- replaced queue to virtqueue
- simplified commit log to talk about msix
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section


Parav Pandit (2):
  conformance: Add missing virtqueue reset conformance references
  content: Support enabling virtqueue after DRIVER_OK stage

 conformance.tex |  4 ++++
 content.tex     | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 3 deletions(-)

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

