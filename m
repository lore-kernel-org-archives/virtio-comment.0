Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430848BF7
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507783; cv=fail; b=MR1hDP6GfrPZZCvjCvps7TuHAX2GuguDv91aa7o5SceoZvalv+W4z3SN9FcSA7fen2bacxN91X+psd72RK5bQz7N2kFIhIjS+Pm5ZSj5L42NWeJNw65hlVAxn7Wz+tXiurOIZ+dtaFnYPNsTu/mwxOFWrBV2YrlHdldNsUSsDFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507783; c=relaxed/simple;
	bh=8aYH9gcPvTF8R/7YzjsjqjYhW5BRqU3ClQ2R7nBSQZY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ESHrGS+f1Yf9LfyFnZHnVL49aF2MrFdx4p9xft5xjxMiNvNqF+bMQx2EeX0s4XLSJFWLPm9RnhwXFTI4X6JY2cwYji1BeT5lkc7YDpEnRdjr3qQl2ZNXyzOw9RQ0VgMcQNTCu7hvlkztMA1Zzht1LTLt8kiKAuMkYmlW+5WL0mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EaouppEq; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EaouppEq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0ck0SCLE7dx0RiklT9osOopuExExr/bd98kNyCBJ+XLx3zIZVrlvluGo3ISwC2ipiMs/yr6lQVhJNxFhvxti+odN7KsMXcoE1KpxR3v8pQrbbTbemM+3vopsEGWBkVglolZqGvlcjX6kXBnA3DF0WBynGVLNNrsCLWuAET0tloD/HfIYwTeWWC1mVO7q0ZcPPLB/ysIW3ftP3ui2Gw4uEe9N9qWaa3J1WcNsp1nM5XXofCMHGqWQOcDJV3zdIUOGuxS9BcFfDk+4iZd1DsIYxjRFQPXJJ9A9lcaTmFuI5hS3P9hj2nxN3KdmUsBTa6I/z0O7Q7hYYv0vy4xcubcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T2ItblIMrN8dM7pBLxkX7krG6Nkl8nI031ieQb3Mjs=;
 b=FER0q0iWmLFIXlcXmt3rGJ2WYM2xkrVgQ8kVUzg7YkFLg6RFxfVJfK5+GPYxrJg2iACmCYy6SwmN24xcjDpvW744TPwnDwaNOYEK9UUajNMWWIFx+Yn4HqvTud+g1/xKH7Z4W7z8uhDwTCg+QLL79hfGO8VBNCe0zgnM9pAVJrMcvTkT4QmiW70sNiWCSxenAtE61eeIUxZYDQX3NvZaNnwGhlH+kwQT2AG2HGHi8wEHmXoyHwWOz6wmFPOVO5vkAbmz0Q/zQu07VnRVfFaa/g8i4PSf80UvJMLQNGlBtrMqAN5mRYeRRJgj2Us70zUqol9iMbvqUaPZQOvzwCqLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T2ItblIMrN8dM7pBLxkX7krG6Nkl8nI031ieQb3Mjs=;
 b=EaouppEqueGimOupEP6WWyL3+ImqZX923pJEklsF94e92o2DUG1kD4W1Tt+nZZEgHJexrq1O67g+ucBytcsYSpepLNlKs6WV0GvwcFnh/3S5xgfP9e+8Snv2ico5A1Sm0AbTRFfs0fozFyY1JhPSZm7QnAcgXXCdcZ4TVWCO0HFIN/QXtDC2hlja0vgE6PNUwUncaep1F9jBtc3CGTKyZJqPmNRCBInzcirY5jAnYeJFFI/mPRtQsnV3KrfRgO5wUINjVcW2n/FqsDfQ5d/B6rPq1gYKt9zeP5nZowHhfJQjh6RdelS9gNu2XMhvJ5pkK1eJY78pdYGySnPAsNwrZA==
Received: from MW4PR03CA0233.namprd03.prod.outlook.com (2603:10b6:303:b9::28)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 13:29:36 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::5a) by MW4PR03CA0233.outlook.office365.com
 (2603:10b6:303:b9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:20 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:17 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 00/13] flow filter using basic facilities of capability and resource objects
Date: Tue, 4 Jun 2024 16:28:50 +0300
Message-ID: <20240604132903.2093195-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 0351764c-168e-4557-aebf-08dc849a6068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FdYhQWglZiaxeFEQFg4X8l6vO1VZCIr7hXIPbcH9udirYP1ziAnPicaatn2a?=
 =?us-ascii?Q?IN7t5B8wYweAPLUirCATBJm7ojNHfWMUaxOO+JCw/+C6lLnqcme9YMAtDO67?=
 =?us-ascii?Q?wwlUsRdMXYFYlpI4bQXNYDZXh+AWhcJFH1MzH+KDulPJyk2shJGn6+g6gQ4F?=
 =?us-ascii?Q?p/RO52nS2s7iqfAAnTFiweTOUghIsgV3sLEx++X55pC03oXQHS0clHiZx4h+?=
 =?us-ascii?Q?pmeLxZyeWotT+Sm4g+NAE8dDhR760pqStXKRukDEXaII8h5pqTGvwwtS8lLA?=
 =?us-ascii?Q?8iO2WzRNbeX6d8qBwC+lcqCLcfnuqGA4qCPE9mRScq6m2qWsn4ptgjcjv2lJ?=
 =?us-ascii?Q?oDYIwHWf+95fPHjIuc/n1TWmw1MUDTUBJ3i8QJydnMosuCEaw/bLBk213Fdw?=
 =?us-ascii?Q?zgDD08uUYC1koLS+2bUPBbXqT2QxoAzyu/8iFkXQuRZUej57N9fBSlA8bVeB?=
 =?us-ascii?Q?XO6wmJyzrWSR2DAXymSBM/VYNAcKlbDd8VNtyexQfrMlooNdqyZLnxHZIHeo?=
 =?us-ascii?Q?BS5/KUUAj2d47a6Il7cRMVy+r76zj57raNMAytKvA8xPCoDLVPJOwJrbdF/B?=
 =?us-ascii?Q?tj4dF5s1iBq3PFa2kooDJSKfOK3W24Cc+FBVOmQZsYGtCgs9PB67tiJN8HfW?=
 =?us-ascii?Q?p3bWNvp6wbaIWpVKEzS/iB9fcVkcJgvn0GP0Diq/TeCWKDo9z20UKJ3FqjSy?=
 =?us-ascii?Q?xU9/uhcUjvNB89AaKWqmtf3D+f7IKbeKfP98JYj9UUuAn4+6sMLLBjv/moUu?=
 =?us-ascii?Q?CgGyqy8r8UWSKSMAC0ychhBdB1+IFcJiGN5kGC7rXGQTLFkhBIxqq5yh//Xc?=
 =?us-ascii?Q?LTjL+cjPoDOe4Bdzf1jNxfYpw6TzlSkOYDZCVRSd+Y6NqyfTIdV841yy+C7N?=
 =?us-ascii?Q?ev46ohKcGqLP2hoTRi+jbNnfOkypjZ9AJ1jsBFswNZBMMm5RXLmFfpKJ5fGA?=
 =?us-ascii?Q?hMidpIzpkz7SXbJLJ8fNnfdisTnZEKs7hc7XEgFkueNH9a82nwnId30pb6iQ?=
 =?us-ascii?Q?9HfYgpdeIJZdyGfEACF8b4X3V1NrHDQUC8H5KHH5Lm7akhYFidjT+btyh7Mi?=
 =?us-ascii?Q?cqXHAKJr0eVoIXOU7gM94qfNHk856oBIuPdz2RX7q7S+cOMc8pAMoNRsGoMp?=
 =?us-ascii?Q?6I5WtkFNLuKyKnDGerVi/teRLGN8weWo9Uw7d6hwPGPQTVLjA8OGt5ZSKKPb?=
 =?us-ascii?Q?N1Tq/ulEH19elYbHwLVt6VdTM1kelUwf4nQ6zvU7U4dbMia/xT/9Hylp7Smv?=
 =?us-ascii?Q?MFUlb2f63psZVA47rzJLyA9skfLbBVQFAd5TeSLif3AM60DyKPRdc5hyCeU3?=
 =?us-ascii?Q?GVvpIy7WoUz66MZXmKLZXlOaKYusk56N1DqxjuuiclDRO+cjiofCHguVZldN?=
 =?us-ascii?Q?djffmK2sG/tkUVy0DCXDe4WmqbDi?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:35.5664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0351764c-168e-4557-aebf-08dc849a6068
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571

Summary:
========
This series improves virtio net receive packet steering to
direct packets to a specific RQ.

This basic functionality will enable Linux ethtool steering,
and accelerated receive flow steering (ARFS) as a starting point,
and more use cases in future.

It is using new virtio basic facilities of capability and
resource objects described later in this cover letter.

Those interested only in the capability and resource object facilities
can jump in the cover leter to "Overview of capability and resource objects".

Net device problem statement:
=============================
Currently packet allow/drop interface has few limitations.

1. Driver cannot add or delete an individual entry for mac and vlan.
2. Driver cannot select mac+vlan combination for which
   to allow/drop packet.
3. Driver cannot not use other commonly used packet match fields
   such as IP header fields, TCP, UDP, SCP header fields to direct a packet.
4. Driver cannot direct specific packets based on the match
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
packet, defines an action like drop/direct to RQ.

The flow filters are organized in flow filter groups so that their
processing can be prioritized when multiple applications wants to use it.
For example, user supplied flow filter rules to take precedence over
kernel stack created rules.

Many a time large number of flow filter rules have selection mask.
This is facilitated by a flow filter classifier which defines the packet
selector fields using a mask; a flow rule depends on the flow filter.

Flow filters are handled as resource objects using administration commands.
Flow filters current usage is in-between of control path and data path.
i.e.
a. ethtool will operate at few hundred cmds/sec.
b. ARFS at few thousands cmds/sec.
c. In future ARFS and connection tracking(CT) may do few millions/sec.

For b and c in future, few options are present.
1. Dedicated flow filter rules management to a specific AQ so that it can
   be accelerated by fast path. This can be possibly done using group level
   or AQ level service class or both
2. Define different admin command format for fast path
3. Special type of new virtqueue for CT driven requests

While a general BPF offload might be a superset of this functionality and
might be desirable, it does not look feasible, in particular, from discussions
with multiple hardware vendors it is clear that hardware will not have such
capability in short to medium term.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179

Overview of capability and resource objects:
============================================
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
5. To provision features, resources from the owner device, one
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
   config space and VQ for read-write fields, creating more mess.
8. It is not uncommon to have some driver resource and number
   of resources would normally be in config space. But to write them
   to use VQ, and without proper resource definition it leads to overflow
   for example, the overflow we experience with mac table.
9. Extending config space and having it accessible even before negotiating
   features when the device does not know if it will be used or not makes it
   hard to build the devices.
 
Above limitations are overcome using new basic facilities as:
a. capability
b. resource objects

Capability and resource objects are an evolution of the (a) feature bits,
(b, c) common and device configuration space and (d) controlvq mechanism; this new
basic facilities are intended for managing a large number of diverse
functionality in a uniform and extensible manner.

a. Capability:
==============
(1) It consists of device and driver resource limits.
(2) It can be modified anytime using admin command.
(3) Owner and member follows same format to get/set using a selector;
    simplifying the provisioning and migration.
(4) Accessing capability via the command interface makes it friendly to
    both software and hardware based devices; possibly to operate even
    without admin vq.

b. Resource objects:
====================
(1) Define device controls in a unified way instead of ad-hoc cvq commands.
(2) Can create diverse type of resources dynamically.
(3) Ability to define common and device specific resources.

This series defines flow filter related capability.
This series defines three resource objects as flow filter group, classifier and rule
to implement receive packet directing facility.

Limitations/Disadvantages:
===========================
1. Device side configuration change notifications are not covered in
capability and resource objects yet as both controls are driven by the driver;
however in future we should be able to add it to query the changes.
In an alternative when notifications are frequent or multiple outstanding,
it is better to come up with generic eventq or notificationq like how
it is needed for alarm feature of RTC in [1], though RTC may proceed
in short term with its own queue for other reasons.

2. It can be used only after DRIVER_OK phase at present, but when needed
it can be extended to have admin command interface to be accessible
after FEATURE_OK and before DRIVER_OK.
So presently capability cannot affect features, but any attempt will
probably run in some corner case.

3. It is more plumbing than config space and cvq; however it is one time
generic work that paves the road for mulitiple device types to use in
common manner, reuse for provisioning and migration. This series itself
uses common framework for 3 control operations of group, classifier
and rule.

4. Current series is unable to provision the device, but a new
command such as VIRTIO_ADMIN_CMD_DEV_CAP_SET utilizing all the structures,
infrastructure can be done in future.

Future uses of resource objects:
================================
1. Dynamically create VQs much after DRIVER_OK phase with multiple
attributes such as multiple page addresses, header data split queues
for net, with PASID, inline header size.

2. Create dynamic counter resources for specific usage

3. RSS context creation

4. net device with timestamping capability

5. RDMA device resources

6. May be more.

Patch summary:
==============
Patches 1 to 7 cover capabilities and resources.

patch-1 adds self group for admin commands
patch-2 make legacy spec section name better to follow this series
patch-3 adds theory of operation for capabilities
patch-4 make table readable across multiple pages
patch-5 adds capabilities admin commands
patch-6 adds theory of operation for resource objects
patch-7 adds resources admin commands

Patches 8 to 11 uses capabilities and resources to introduce flow filters.

patch-8 adds theory of operation for flow filter
patch-9 adds device capability
patch-10 adds flow filter group, classifier and rule resource objects
patch-11 adds flow filter device and driver requirements

patch-12 clarifies the newdevice section
patch-13 describes the use of capability and resource extension

Please review.

This series is on top of branch 1.4 with patch [2] cherrypicked from master branch.

[1] https://lists.oasis-open.org/archives/virtio-comment/202312/msg00110.html
[2] https://lore.kernel.org/virtio-comment/te6tzbegqky7uz4skrag3yowet3phtq6nn7tegyrillgb4juwn@m4gi5ohfuk7m/T/#m25e8e7bfd2e4d9e2fc42ab36750715a272b419bb 

Changelog:
==========
v10->v11:
- fixes comments from Satananda
- improved driver normative for two resource objects with same ID
- fixed the field name to not have 'per_group' in it as it
  applies to all flow rules
v9->v10:
- rephrase the self group description
- removed duplicate description sentence in self group
- replaced 'functionalities' to 'functionality'
- added missing article 'the'
- inserted patch for legacy commands to follow new commands format style
- replaced capabilities to capability
- rephrase for listing for device type specific capabilities
- rephrase the first para description of capabilities
- removed white space at end of line
- squashed the dedicated patch of status codes with the usage patch
- renamed read/write caps to device_get_cap/driver_set_cap
- restrict get and set command to only self group
- supported_caps renamed to cap_id query
- removed length from the get/set/query commands as it can be derived from buffer
- renamed cid to id as its part of the cap command structure
- grammar corrections with article and others
- renamed rid to just id as it is part of the resource related structs
- removed length field from the commands as it can be derived
- rephrase for group_member_id
- squashed the patch that added the error codes
- removed num_types field
- used singular capability
- updated example to have rtc for net device
- introduced mask object that improves the flow rule efficiency and
  removed fields_bmap per field type bitmap

v8->v9:
- changed command name from read_data/read_result to query_data/query_result
  to match the opcode name and description
- added fields_bmap bitmap to support future support of optional fields
  in the resources without inventing new set of commands, for example
  multiple pages in the VQ, PASID in VQ, flow counter id in flow filter rule
  etc.
- fixed spelling from 'destroyd' to 'destroyed'
- fixed 'upto' to 'up to'
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
  admin: Use already defined names for the legacy commands
  admin: Add theory of operation for capability admin commands
  admin: Prepare table for multipage listing
  admin: Add capability admin commands
  admin: Add theory of operation for device resource objects
  admin: Add device resource objects admin commands
  virtio-net: Add theory of operation for flow filter
  virtio-net: Add flow filter capability
  virtio-net: Add flow filter group, classifier and rule resource
    objects
  virtio-net: Add flow filter device and driver requirements
  newdevice: Improve the appendix chapter heading to reflect the content
  newdevice: Extend informative guidance on capability, resource objects

 admin-cmds-capabilities.tex             | 233 +++++++++
 admin-cmds-legacy-interface.tex         |  24 +-
 admin-cmds-resource-objects.tex         | 268 +++++++++++
 admin.tex                               |  51 +-
 conformance.tex                         |   4 +
 device-types/net/description.tex        | 609 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 introduction.tex                        |  21 +
 newdevice.tex                           |  37 +-
 virtio.tex                              |   2 +
 11 files changed, 1222 insertions(+), 29 deletions(-)
 create mode 100644 admin-cmds-capabilities.tex
 create mode 100644 admin-cmds-resource-objects.tex

-- 
2.34.1

