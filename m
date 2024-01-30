Return-Path: <virtio-comment-return-9039-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C751C46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8D6422CADA
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7F0C29868B1
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 74799986876; Tue, 30 Jan 2024 14:07:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 678F6986880
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ1JjxxF2T32fjObNME8Vu7tulnuerkzMIi+DPiB6FmK+1M0bp5JckteAeYwJLXgPEDnK1kyw1SVhB+mSuqGjhWukBZua9P691b6J42czPq+sNmsxy6SIx8dOw/fCl6BI7SD5bICULorF7iESbR1n2pQhAarYGVGKoEpOhBXFLZk6gxP0VRr5Rkv8U+PCP9HsEsUEweYY0KdHTOWAUD2syMRjk/EuyZGNGMghX0g9yyKQK1HISEke5f0CrlMkrGzBazJduzHJlTHBb/T8qQ8h7gkK9RJv5gw4MeKNiIxPJE/46q5ikGgmpdTXt6/32Pk+CVAkJjX4aM6UYZUtc+emA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWednz/BEC6CKMaRGRHbLaJz4va2HTmE9CIkIWOYLw4=;
 b=VRfgSyC89uh5g56LIVQ6YgNCqqzhdWY9Ash+d2GwieoE5UlQTxk580t8j5cPYTSwVo7+zuS9vNpvw7bPoMeq/xzqio6QwyynTtY/s/SQiL3+DfB+xvQuDYup8abLCRX0jnV5wx+G7DK+aCMxrOA15qedPfommJ3ugNV9Tau3csTCKqS7Okm8IZITg6C96ehwhs9XMA9V3Qy+nfbGVRwG4aZ8OmRiYsvwtPYlf1ttgww+/ta2liPQ5kvlre1uvfMCBK2Nq8XDIFlbOkfzTtNadi61ahnn2gDj4n+ZAi0+8C0WWK3qr/RJndUGpQhcClE2izJ9mqbUuPIukjIjk0jcHg==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 30 Jan 2024 16:06:29 +0200
Message-ID: <20240130140642.406882-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CH2PR12MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: a679a78b-58ab-457e-627f-08dc219cc47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KhacM3awJkj/uL9wQBCGF2PoyTlga9Lm7BP+UEQP+fJD/L3DM8HCSPH8mx8EMvpCDKXXIRI0ySD5OgNOIm3wxFr/QRuP0X4jLIQo1kzc+Yu17fibxCnrxcV4voRugmtOAAgrzNTB+PtbMT3xw7zRovHd1MX+AD+1LAtisJ4TSBTduzmDiMNp1uazCILip/sPFToY2LCSRxgN2Tr/61YEzq/5kFsWFpZ9DdeYnXNwzKR2Uqm05tq2uOYxGzkN/MlaBOfl7jLWzK+X8XQiVOaKaKl686y2WpPcW39+JJV1WObpjmpLeNIf15w3mXCDZdI0yTIs0FzfKBpctlRpLZhSPUSpCpCn5H1YN58zGqtlNpogOSdIVO9vkqZSsBgAjilmZqtBw5l3jcI1pMELShQrClmNE2PnmK1WPpYzsfQlogqRnmdwHOGqHFiUT2q1oaz6J9AWPrC/PGLSLBgMtoXy2oYilMbCK5w2n9mK0J5G7Nls+cfL0X9OdjHzfUg2Obd/MpkkRTN/LLPArJVOhRLnhAezyr/Yvv0oQEi8A1bfnANfkSrdsT83UbnktxiEvGJajc6wGVSWp0e/IpaMgc0AshpTYIBRj37NtMtryJTW7YygcFfNmtM43Hs7/gan9aUZJVEBOGqb5Ac+DALPYYOutJB5KDSov9E56aQbkU2yUWAYTwW5lLkwJsYiyX0PQDrybkjQu8vH0AJ0JUZdO0IIz06oywGP83fvRqjcVJOXrnW2atnzonLWHzBcjIVM0qVrIhua1HE7z3Wz+bNcDItxjk6f6Wnxn3Wd164iBqhC3pY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(40470700004)(46966006)(36840700001)(83380400001)(16526019)(426003)(1076003)(6666004)(336012)(478600001)(36860700001)(316002)(47076005)(8936002)(107886003)(2616005)(30864003)(4326008)(5660300002)(41300700001)(2906002)(966005)(8676002)(70586007)(54906003)(110136005)(70206006)(82740400003)(36756003)(86362001)(356005)(7636003)(26005)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:17.2968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a679a78b-58ab-457e-627f-08dc219cc47e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938
Subject: [virtio-comment] [PATCH v8 00/13] flow filter using basic facilities of capabilities and resources

Summary:
========
This series improves virtio net receive packet steering to
forward/steer packets to a specific RQ.

This basic functionality will enable Linux ethtool steering,
accelerated receive flow steering (ARFS) as starting point,
and more use cases in future.

It is using new virtio basic facilities of capabilities and
resources described later in this cover letter.

Those interested only in the capabilities and resources facilities
can go straight to section "Overview of capabilities and resources".

Net device problem statement:
=============================
Currently packet allow/drop interface has few limitations.

1. Driver cannot add or delete an individual entry for mac and vlan.
2. Driver cannot select mac+vlan combination for which
   to allow/drop packet.
3. Driver cannot not set other commonly used packet match fields
   such as IP header fields, TCP, UDP, SCP header fields.
4. Driver cannot steer specific packets based on the match
   fields to specific receiveq.
5. Driver do not have multiple or dedicated virtqueues to
   perform flow filter requests in accelerated manner in
   the device.

Solution:
=========
Flow filter as a generic framework to overcome above limitations.

Overview:
=========
A flow filter defines the flow based on one or more match fields of the
packet, defines an action like drop/forward to RQ.

The flow filters are organized in flow filter groups so that their
processing can be ordered when multiple applications wants to use it.
For example, user supplied flow filter rules to take precedence over
kernel stack created rules.

Flow filters are handled as resources and managed via administration commands.
Flow filters current usage is in-between of control path and data path.
i.e.
a. ethtool will operate at few hundred cmds/sec.
b. ARFS at few thousands cmds/sec.
c. In future connection tracking(CT) may do few millions/sec.

For b and c in future, few options are present.
1. Dedicated flow filter rules management to a specific AQ so that it can
   be accelerated by fast path
2. Define different admin command format for fast path
3. Special type of new virtqueue for CT driven requests

While a general BPF offload might be a superset of this functionality and
might be desirable, it does not look feasible, in particular, from discussions
with multiple hardware vendors it is clear that hardware will not have such
capability in short to medium term.

Flow filter requirements addressed by this series is worked by virtio community at [1].

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html

Overview of capabilities and resources:
=======================================
Config space has few advantages as below.
1. extendible
2. common way for each device to keep expanding it
3. provisioning to supply offset, value to set fields

However, the combination of feature bits + common config space +
device config space + cvq creates four different communication
channel between driver and device, each with a varied degree of
limitations and complexities listed below.

1. Feature bits cannot be modified at later stage in the driver.
2. Feature bits are boolean; it cannot communicate amount of resources and
   configuration details. For this yet another config space or cvq is needed.
3. Making configuration space writable and also synchronizing it with device
   operation is very hard.
4. Modifying and controlling the device operation using cvq largely works but
   limited to specific device type and requires per device type cvq.
5. To provision features, resources, functionalities from the owner device, one
   still needs new admin commands.
6. It is hard to maintain and access variable length array in config space.
   We have to add the fields at the tail, this means if we start with
   foo1
   bar1
   later, to add foo2 it becomes
   foo1
   bar1
   foo2
   We end up with structure with mix of unrelated fields spoiling the
   readability/aestethics/maintainability.
7. Any writeable config space is a problem; for example very
   inefficient on pci as you have to read after write. It also
   lacks atomicity across multiple fields. So to avoid writable
   config space, and to use VQ, things spread around read_only 
   config space and VQ, creating more mess.
8. It is not uncommon to have some driver resource and number
   of resources would normally be in config space. But to write them
   to use VQ, and without proper resource definition it leads to overflow
   for example, the overflow we experience with mac table.
9. Extending config space and having it accessible even before negotiating
   features when the device does not know if it will be used or not makes it
   hard to build the devices.
 
Above limitations are overcome using new basic facilities as:
a. capabilities
b. resources

Capabilities and resources are an evolution of the (a) feature bits,
(b, c) common and device configuration space and (d) controlvq mechanism; this new
basic facilities are intended for managing a large number of diverse
functionality in a uniform and extensible manner.

a. Capabilities:
=================
(1) It consist of device and driver functionalities, resource limits.
(2) It can be modified anytime using admin command.
(3) owner and member follows same format to read/write using a selector;
    simplifying the provisioning and migration commands.
(4) Accessing capabilities via command interface makes it friendly to
    both software and hardware based devices; possibly to operate even
    without admin vq.

b. Resources:
==============
(1) Define device functioning in a unified way instead of ad-hoc cvq commands.
(2) Can create diverse type of resources dynamically.
(3) Ability to define common and device specific resources and hence behavior.

This series defines flow filter related capabilities. 
This series defines two resources as flow filter group and rules to
implement receive packet steering facility.

Limitations/Disadvantages:
===========================
1. Device side configuration change notifications are not covered in
capabilities and resources yet as both are driven by the driver;
however in future we should be able to add it to query the changes.
In an alternative when notifications are frequent or multiple outstanding,
it is better to come up with generic eventq or notificationq like how
it is needed for alarm feature of RTC in [2].

2. It can be used only after DRIVER_OK phase at present, but when needed
it can be extended to have admin command interface to be accessible
after FEATURE_OK and before DRIVER_OK.
So presently capabilities cannot affect features, but any attempt will
probably run in some corner case.

3. It is more plumbing than config space and cvq; however it is one time
generic work that paves the road for mulitiple device types to use in
common manner, reuse for provisioning and migration.

Future uses of resources:
=========================
1. Dynamically create VQs much after DRIVER_OK phase with multiple
attributes such as multiple page addresses, header data split queues
for net, with PASID, inline header size.

2. Create dynamic counter resources for specific usage

3. RSS context creation

4. RTC timer capabilities and clock resources query and its
configuration for [3]

5. RDMA device resources

6. May be more.

[2] https://lists.oasis-open.org/archives/virtio-comment/202312/msg00110.html
[3] https://lists.oasis-open.org/archives/virtio-comment/202312/msg00112.html

Patch summary:
==============
Patches 1 to 6 cover capabilities and resources.

patch-1 adds self group for admin commands
patch-2 adds new status codes for admin commands
patch-3 adds theory of operation for capabilities
patch-4 adds capabilities admin commands
patch-5 adds theory of operation for resources
patch-6 adds resources admin commands

Patches 7 to 11 uses capabilities and resources to introduce flow filters.

patch-7 adds theory of operation for flow filter
patch-8 adds device capabilities
patch-9 adds flow filter group resource
patch-10 adds flow filter rule resource, match keys, actions
patch-11 adds flow filter device and driver requirements

patch-12 clarifies the newdevice section
patch-13 describes the use of capabilities and resource extension

Please review.

Changelog:
==========
v7->v8:
- updated commit messages
- updated newdevice.tex for more Q&A around capabilities, resources,
  administration queues
- updated resource text as non data path operations
v6->v7:
- fixed plenty of grammar suggestions from Cornelia
- introduced device/driver capabilities and device resources generic framework
- rebased flow filter to use capabilities and resources
v5->v6:
- pick next unique bit 65 as to avoid conflict with rss context feature
- fixed missing conformance links
- removed white spaces at end of line
v3->v5:
- removed left over dependencies of flow filter virtqueues
- removed partial sentence
v2->v3:
- removed dependency on dynamic queue infrastucture which is
  not yet ready
v1->v2:
- addressed comments from Satananda
- squashed with match fields definition patch of v1
- added length to the flexible array definition struct to benefit
  from future runtime length bound checkers listed in
  https://people.kernel.org/kees/bounded-flexible-arrays-in-c
- renamed value to key
- addressed comments from Satananda
- merged destination and action to one struct
- added vlan type match field
- kept space for types between l2, l3, l4 header match types
- renamed mask to mask_supported with shorter width
- made more fields reserved for future
- addressed comments from Heng
- grammar correction
- added field to indicate supported number of actions per flow
  filter match entry
- added missing documentation for max_flow_priorities_per_group
- fixed comments from Heng
- grammar corrections
- spelling corrections
- fixed spelling from initializaton to initialization
- added more requirements for multiple actions

v0->v1:
- addressed comments from Satananda
- added device requirement to return non zero value in fields_bmap
- added device requirement to not repeat filter type in response
- added driver requirement to order filter match field as it
  appears in the packet
- added device requirement to fail group delete command on existing
  flow entries
- added mask field in the type to indicate supported mask by device
  and also in later patch to use it to indicate mask on adding
  flow filter. As a result removed the mask_supported capability
  field

Parav Pandit (13):
  admin: Introduce self group
  admin: Add more admin command status error codes
  capabilities: Add theory of operation for capabilities
  admin-cmds-capabilities: Add capabilities admin commands
  resources: Add theory of operation for device resources
  admin-cmds-resources: Add device resources admin commands
  virtio-net: Add theory of operation for flow filter
  virtio-net: Add flow filter capabilities
  virtio-net: Add flow filter group resource
  virtio-net: Add flow filter rule resource
  virtio-net: Add flow filter device and driver requirements
  newdevice: Improve the appendix chapter heading to reflect the content
  newdevice: Extend informative guidance on capabilities, resources

 admin-cmds-capabilities.tex             | 161 +++++++
 admin-cmds-resources.tex                | 186 ++++++++
 admin.tex                               |  34 +-
 capabilities.tex                        |  43 ++
 conformance.tex                         |   4 +
 content.tex                             |   2 +
 device-types/net/description.tex        | 587 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 newdevice.tex                           |  70 ++-
 resources.tex                           |  74 +++
 11 files changed, 1151 insertions(+), 12 deletions(-)
 create mode 100644 admin-cmds-capabilities.tex
 create mode 100644 admin-cmds-resources.tex
 create mode 100644 capabilities.tex
 create mode 100644 resources.tex

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

