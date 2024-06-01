Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595D914E2F0
	for <virtio-comment@lists.linux.dev>; Sat,  1 Jun 2024 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253483; cv=fail; b=M7tjCBuRspzbVQkq8G+fk6+mrZJ3skHe87ZMWFPQuKGjnxXjFFYN/jL+/a+0tFcTFzIFC0zEj5qg1LarB2wrj3rjanlPHiZ4O4O4i4dScrOOiYbeRFb9+dqVpvHeX/h/NwdP/ZsTLG5vH15sI1LyKOo9HUPmYttEldgVW41i6SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253483; c=relaxed/simple;
	bh=cTtl/2kzT5KJZSlBFYHrS807w5NQrs5CAFsXSEavJzw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FEKzgOuCC+XjW7y1+5TPTI1hgBmQRTj08e9Q+c7Up6bRM0s8P91nI1gchV80UTqHkYTnAyW35mFjwmf7a503HpQljO/4yiqdX48lh7AACW3AhRVotFUD8lPTby6gi8AH/IJpPQOQWvoTyRI5j/qXTvREfciULc9YXTDebX217gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oH4eSilX; arc=fail smtp.client-ip=40.107.212.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oH4eSilX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPspyCHEwLPS7HK0MfzrEQZNnrw1Tejv8RRRnEg0VC2K1oRv3Ofnjn2UR+XxvFTm0A04ZVegLdF5oOecdjuGmotQD5gz8QS9JbXJAPZaQPUxOYbO7v04rAGdRXNCTTg/5pqU/nOB6s28+KCypwyQBpzKC9eb7L++ql1kinrJc1bk2kR5wwfjI7iWMwu1qyNVeJBDDWTpTcIEgoqrVm8j5CRBmAplFcru0nIweP/VN6DfM4gx6bJysf7OYub9tsnOfV19ElgjHbXC2G3XDSyrpYqrb81e9JnZTbobDcL1s445REiAfHwpve8oHO8qrBKIWQXKmevTtT8n1z4q+mu7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dixpVQHfkJF9eMPc2RxdcaRKvUk+TU/RyoldRq7EnhA=;
 b=bK4j7iJU9nEqP2WpujvMNg8mqRGB4MexX9V65gGqTXjJ8ghNp2JN2MuHEmTI8ioC5I5dMAMUKHEu1vTjpB11syWhva5UYYjFfg05nU4DInEUiDOsWK0UN4SUw2C0N+qubOYgNmlmLajgHMDSzGnCqsSLcvIADBvgwYbTTjSIdsxzAl01P/GHtedvlaDfKcl2cXzvCvVZFBRMw3rKw2egB0AXZNBmudAsfw2x6Bl4ieIDGMTvxxTLE46kE9RCyVskdVcO6BDOydizHtW8O1ZnRO8t32PJeB77LcR9CAUGVhAhNrWd+FWxN6hQX3D1Ns11fYDSFHWr/YhySEgSVwPCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dixpVQHfkJF9eMPc2RxdcaRKvUk+TU/RyoldRq7EnhA=;
 b=oH4eSilXPHZ6z1Pb1IIbjmxS7ni7YNuFEpc0vjzlRf71deDlm7rHY5VUN8+Q9gEPuB6yK939iW5Brge/MZA6pIJflv6Cyv0ySA9xvfZFnTvp/tv4CHQjF/VoPQQSWv6ixaHUL2N/OM4Cy4hu/747F3U58OaCijpRd87EJeThoI9qI3IY+hkZ0FpHVAuoGQxxE7XiWpH6PyvNdAqxN7TBn7ks7eyxeHHEMMc+f2dqoyY/QvhfnSC83WkKvPM2i98tq+mmSI6a2/IMB6MpkUDS2beYQp1SOw33ya/GI+WXw2Z2BEvmYJi4VtQKwDxb+rAWQ9kGd9kkFvZdaeyNwUat0w==
Received: from CH2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:59::14)
 by MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Sat, 1 Jun
 2024 14:51:16 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::86) by CH2PR03CA0004.outlook.office365.com
 (2603:10b6:610:59::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Sat, 1 Jun 2024 14:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sat, 1 Jun 2024 14:51:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 1 Jun 2024
 07:51:06 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 1 Jun 2024 07:51:02 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <jasowang@redhat.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<maorg@nvidia.com>, <yishaih@nvidia.com>, <lingshan.zhu@intel.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH v5 0/5] device parts handling administration commands
Date: Sat, 1 Jun 2024 17:50:37 +0300
Message-ID: <20240601145042.2074739-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: e209384c-dab6-423c-e432-08dc824a4a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cYWKfp+6m6yS5R3CRr/nm8c43802JnIE2xQWEBe4aEFg91BqRjwHGvQEJhpn?=
 =?us-ascii?Q?GrwCoL918xx0TD9JNH5RIdbJTFuDvOjlhVKc1vK1P6DC1JlO97jp/K5vPD6Q?=
 =?us-ascii?Q?R+JTedCrt7qAlD1LeY+zhedLwCniMYvjrhzuS4niWhMhF3YeFGWcTE5AvKax?=
 =?us-ascii?Q?J3KWsHjGUGm5u4XyO1Hkt4zHiiIss1LIizsJB7vPxtOabo0ZMlhChOXvagiw?=
 =?us-ascii?Q?3r5P2e1nEwdW8jZOBa64UehyPu3RNIiGjMeTO542ZlJx77IvUm7CiUhTE2fC?=
 =?us-ascii?Q?Wv6IyN39CtHZwn01p3LXSSStb4+LP2KovCysuntqUhCh+PqcJN+UNuNaMiZr?=
 =?us-ascii?Q?DheSin7PDBKdycDpYWYKyIoICnSu0UbVP5lSim1p5UN87tW1XCFj98qqub+r?=
 =?us-ascii?Q?QzCL6XnX/d04hCYQ4KkknLmxjYAUU0KexHz5C0SawBdnRSO+rDFUiKinJIy/?=
 =?us-ascii?Q?Zz0rWkFI5TBVws/NgFcwkEZzcDCPFPkwmMtd7GQ3qE0nDGCcvYHC9VAqoscE?=
 =?us-ascii?Q?5MsS8I1OVphysww73z5C1blLPMKPYgNb3LF3wg9YXZWe3jDPHy0juwKToAYx?=
 =?us-ascii?Q?6VksukVq6nnCBG+XeGNprJ6TUEj9x3gBoZUTMBtIgw0t3zCVFrKVFIBpZmz3?=
 =?us-ascii?Q?EmT7loEYcYUSCUwgQrcimMIRWHCDO7QM2FvS2KIjrK/IeQlZDAcsrXqrj462?=
 =?us-ascii?Q?TWuFYBqIX8t7wnBlHg57q+JVQsi9mYgyTsQkLj7gk+dKBYgPjhIc7YxBQ/n/?=
 =?us-ascii?Q?EhiVpXAse8iLOI05BH5r2A32ob5ppg/+qLmGohLLwDWE4fiO40xm+H+vdeDJ?=
 =?us-ascii?Q?94wet0ntIpmzIu9X6iCX2YQnY2QA1ctHg5BpYweMmKzHW+gCVbtT5DWGQMSb?=
 =?us-ascii?Q?ttkyCoVV+E1DhntqlkjoZdxRMnHIINtELw0EmCmm3KToz1fE0C88r2nQDYSl?=
 =?us-ascii?Q?b1IUv1mvCnU7cydK6xkXWRfktUwG4SEBB9X7VIYzX98AHoMXZZ4OFPOZ8NNC?=
 =?us-ascii?Q?dzb33NmFj1uSHDT89/djpPVS6HMCjmvoG1rW9WStocAm0PTXSslmXnN1rxUg?=
 =?us-ascii?Q?psFGc/1kgdgrHLQ+fvD0FqD6j5w8G9Knd0stWckRdMV+u3SPI0Mc2Dct0QnO?=
 =?us-ascii?Q?wxRLAb6KtDzHbO7KOPfAu4pYhr8tBNrG204jHxUrfIMYkq8SOCIWKQhld9+T?=
 =?us-ascii?Q?FecmMV/AyVLRAQMvtotkz4aBLha3L+FG+7GnlBq3CMgXz2OSPkTYIrvTHggV?=
 =?us-ascii?Q?tUfGNMPOHKIsO9bJ0cKTydv26EuyrYFGdZo6q3teUfoQ+OWgtc9XYLgez0Nu?=
 =?us-ascii?Q?gQ18J1cE9MCYBwIV0R5sJuLn30edZSZcRG7H9NoCmUeLCiGz6XtD+4XkCq5W?=
 =?us-ascii?Q?PxsRT29j+9CdS7se8bcXoE7BrZO6?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 14:51:16.3399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e209384c-dab6-423c-e432-08dc824a4a46
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666

In some systems, there is a need to capture the state of all or part of
a device and subsequently restore either the same device or a
different one to this captured state. A group owner device can support
administration commands to facilitate these get and set operations for
the group member devices.

For example, a hypervisor can use the administration commands to
capture parts of the device state and save the result as part of
a VM snapshot. Later, the hypervisor can retrieve the snapshot and use the
administration commands to restore parts of a device to resume
VM operation.

As another example, these commands can be used to facilitate VM migration by the
hypervisor: one (source) hypervisor can get parts of a device and send
the results to another (destination) hypervisor, which will in turn
set (restore) parts of (another) device to resume the VM operation on
the destination.

As always, these commands can also be used for debugging the device.

The device comprises many device parts which the driver can get and set.
Administration commands are provided to either get and set all the device
parts at once, or to get the device parts metadata that indicates which
device parts are present, and later to get and set specific device parts.

To get and set the device parts or their metadata, the driver first creates a
device parts resource object, indicating whether the object should
handle get or set operations but not both simultaneously.

This series introduces administration commands for handling
the device parts.

It takes inspiration from the similar idea presented at KVM Forum at [1].

Presently, administration commands are limited to the owner device
handling device parts of the member device. However, in the future, this
may be extended to a wider range of devices. For example, a member device
may be able to handle parts of itself, or an administration device
may handle parts of other devices.

Currently, this series does not define specific parts for individual
device types. Such device parts will be added subsequent to this work.

This series depends on and uses the capabilities and resources infrastructure
introduced several days ago in series [2].

[1] https://static.sched.com/hosted_files/kvmforum2022/3a/KVM22-Migratable-Vhost-vDPA.pdf
[2] https://lore.kernel.org/virtio-comment/20240521122937.2004180-1-parav@nvidia.com/T/#t

patch summary:
==============
patch-1 adds device parts theory of operation and overall flow
patch-2 extends resource objects command for sriov group type
patch-3 defines administration commands related to device parts
patch-4 defines common device parts
patch-5 lists requirements for device parts administration commands

changelog:
==========
v4->v5:
- removed write recording from the device to future work
- removed device state (aka device context) tracking to future work
- simplified freeze and stopped mode, to a single mode stopped
- reworded from 'device context' to 'device parts'
- simplified the theory of operation description and command descriptions

v3->v4:
- updated commit message to be more precise for mapping
  a PCI VF member device to guest virtual machine
- skipped adding msix table and pba table as they are mainly
  programmed by hypervisor which has the knowledge of vcpus
  and contains system specific encoded information which may be
  different on destination hypervisor
- moved vq enabled field to vq config struct so that it can be used
  for packed vq and split vq uniformly.
- reduce length in the field tlv from 64-bit to 32-bit to be realistic
- added missing num_entries in the feature bits tlv
- fixed copy paste error on structure for
  VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC field
- corrected discard field type location and enum values
- enhanced queue context
- made device context read command more flexible for device
  implementations
- improved read command to be finish quickly during freeze mode
  to have lowest possible downtime
- improved description for query supported fields command and
  device context to report the length in it
- moved read context command dependency on output field
- added remaining context size bytes in read response so that
  after the device mode is changed to freeze, the driver can
  get most accurate information quickly to decide when to stop
  reading the context from the device
- relaxed device context formation and processing to simplify the
  device implementation
v2->v3:
- updated cover letter to reflect the use for passthrough and for
  only data path acceleration
- updated cover letter to utilize same infra for nested
- Addressed comments from Michael
- updated read context command to not depend on returned data
  length for closing the read context stream, instead depend on
  explicit read response with zero length
- fixed copy paste errors in write context command for fields
  description
- added device and driver normatives for {_START,_END}_MARKER fields
- wrote member VF device instead of VF device
v1->v2:
- Addressed comments from Michael and Jason
- replaced iova to page/physical address range in write recording commands
- several device specific requirements added to clarify, interaction of
  device reset, FLR, PCI PM and admin commands
- added device context fields query command to learn compatibility
- split device context field type range into generic and device specific
- added device context extension section to maintain backward and future
  compatibility
- several rewording in theory of operation
- added requirements to cover config space read/write interaction with
  device context commands
- added assumption about pci config space and msix table not present in
  device context, which can be added when hypervisor need them
v0->v1:
- enrich device context to cover device configuration layout, feature bits
- fixed alignment of device context fields
- added missing Sign-off for the joint work done with Satananda
- added link to the github issue

Parav Pandit (5):
  admin: Add theory of operation for device parts
  admin: Extend resource objects for sr-iov group type
  admin: Add admin commands for device parts
  admin: Define common device parts
  admin: Add requirements of device parts commands

 admin-cmds-capabilities.tex     |  16 ++
 admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++
 admin-cmds-resource-objects.tex |  29 +-
 admin.tex                       |  12 +-
 conformance.tex                 |   2 +
 content.tex                     |   1 +
 device-parts.tex                | 231 ++++++++++++++++
 newdevice.tex                   |  24 ++
 8 files changed, 778 insertions(+), 6 deletions(-)
 create mode 100644 admin-cmds-device-parts.tex
 create mode 100644 device-parts.tex

-- 
2.34.1

