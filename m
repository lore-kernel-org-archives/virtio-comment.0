Return-Path: <virtio-comment-return-9088-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E4EC4828F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 513D722371
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41936986912
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 335A69868D8; Wed,  7 Feb 2024 07:24:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24AD89868DC
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvYFms1VgynyU1D/mpd9kPExjP/qyvTcQntoKa5ng8kcyr+bNq5RXt6RDlaEDu6ULpZFpsgJaJA2ef2vDtOyvLhMPNqIOgpUZ99G1n1bylHQIW39sM/rbUTXEjXOYl99nde4t1EZ7MypG9Y+kMp1nIWN8FoNfZoahSL0RSs5PZKyVSGlDyKOm1kWATwh+1xl4YduxtS8DaprKvNjDe2PYbq9w0+9I4gujW8JQXXgBe1taINA3fmBAodn5kc8l+TvmubQiGlmwhjQR1n9zNg8s6Z95gGp1mXRLpxIUAI9RRq7JvYPuOmL+ASuqPVZGP5vIB8nLv2D8VlmAfAeLiZ6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmKBpfPeHARmb3mU9pF5oeEpNC+Ev659rFo4VY7tPBE=;
 b=Us5ptWFNpBD5h/qweWCEcuM7KErJNxtT4xZj0P4NOcmY0Z2G3ulRGDknMv9/JGch5qP72RAdJLoPy7rNAG/1dTnD7p0KacHjF2BJUq1/3Quf6oK0GBlWaAoZACRwgk1VJTtTGy6Iu+AvmtQPhkHDL0e0KxQBcwayG+HNCKYovWgwXOjTsXCwui0PR07evzeaeE/zpyyvKDVjozX72HrggyuPePN7WI8YWLh0neqUlplcd4Ph0p6tUuHqmRCA/T2LWAbeDgFJ8H3OwoF/R5VoHvVOqikrHS//KeHJaKsG7RE5cZGTilIlK1kkVxcSXj7CkCBYW4hyojAIZzGClGQ23g==
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
Date: Wed, 7 Feb 2024 09:23:36 +0200
Message-ID: <20240207072336.477606-14-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207072336.477606-1-parav@nvidia.com>
References: <20240207072336.477606-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f6f88f-8b66-45d2-24b5-08dc27ade196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aETANzg8YzpT+W4WVmNDlitbyT/8aJVHOeSa9W+HmpybQsXwQ9ctQXTvCgEwkzIKTrdNi5otcSwu0S2A3JveDJrkDRwKCOEmgGoy5uksD/1zAUa6uF8YmBmSgK1UvLquzK9cBaL9I756IMurbQlWlJZ9ZUOOWfHl3wbCiNSVo0DJ/OhbWz7rMjA0REiLJyeklBnEsMUzfRE2aMdkP/UZ/TJ/pbAFgftTB7s6ze/yCBpgWi6NEZuM3FZyG8jIdws3QRg9nsrpCNKw2iUhXU7KozC1jcE8YKrQc2OKO7Mccu8H6zwmoe9Gvwb+8UCYZ41qeCtTGd0VCL0qONC5E5cxscxxE8X2qysEndwE11yoEfeg4FYz9I6ndMDizMnOA61kkjW51VMpS/ar/6d7HYi2PNmivj+cCYGSDTmW1cvXrEBuCA4kaixBDi5AX3CGWFvhNGjgkmM+MqPetJPpsdioK4JjfB3PTHbJ5g1yZSe3iAyex8+L5cInJC0Xk5yFfXI/FXMVS5to1bPEYOOhSs7I2OXaRaY2Wl+XcbiTFcRZWUXqf6eoWDzkUYIEIZjlqZmLBPTOaWGn+kCR3Dyv97635a2UGvzHaHUp8Bg5KGd91XliN3UVXkEIHklrdCNB2UIVZkf36olwpcAJEqEHhX1w5wVNWU5NVNYZwNMVqRle0hrSulUWkWUTR6g4CI4Bb3RFy5dAERz3CY7TGBR/CTDdPw5aPqCc8rCJvNCsxHLMHdBP/1iEO3+Fi1dq4ftyKkCZCMpG++ean3xB0nn+FA7yB33xaVUTyl9ye1b751THXNw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(82310400011)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(36756003)(40460700003)(40480700001)(47076005)(66899024)(70206006)(966005)(16526019)(478600001)(107886003)(82740400003)(336012)(41300700001)(8676002)(2616005)(83380400001)(26005)(316002)(356005)(1076003)(426003)(5660300002)(2906002)(7636003)(110136005)(8936002)(36860700001)(70586007)(54906003)(4326008)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:54.5900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f6f88f-8b66-45d2-24b5-08dc27ade196
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
Subject: [virtio-comment] [PATCH v9 13/13] newdevice: Extend informative guidance on capabilities, resources

Add few informative guidance/notes about which use cases to use
device capabilities, and device resources.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v7->v8:
- improved the examples and text for usage of device capabilities
  and device resources
- added more Q&A to clarify the resources and capabilities
---
 newdevice.tex | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/newdevice.tex b/newdevice.tex
index 93feb71..02e79b5 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -13,6 +13,46 @@ \section{How Many Virtqueues?}\label{sec:Creating New Device Types or Extending
 receive input, and one which the driver places buffers to
 transmit output.
 
+\section{When to use Device Resource?}\label{sec:Creating New Device Types or Extending the Device / When to use Device Resource?}
+For a desired device functionality,
+(a) if majority of fields are configured by the
+driver, or
+(b) if device sets majority of fields which are changing often and
+driver wants to query them, in both of those cases, using a device
+resource is preferred.
+
+Even if such functionality is limited to small count as small as one,
+using a device resource can be helpful with large number of devices.
+
+Some examples of implicit device resources for network device are mac
+and vlan table, rtc or PTP clock; examples of explicit resource is virtqueues or
+crypto sessions for crypto device, flow filter counters for network device etc.
+
+\section{How to expose various Device Resource Limit?}\label{sec:Creating New Device Types or Extending the Device / How to expose various Device Resource Limit?}
+If a device supports resource creation to the driver or if the device
+has some implicit resource(s), and device wants to share such resource limits
+to the driver, how should device expose these limits? The device, should
+expose these resource limits using the device capabilities.
+
+\section{When to use the Capabilities?}\label{sec:Creating New Device Types or Extending the Device / When to use the Capabilities?}
+Any field which is more than a bit that a device want to expose to the
+driver, can be exposed as a device capability. Device and driver
+capabilities are not constantly changing fields during the life cycle
+of the driver and device; capabilities are rarely changing parameters
+used during the life time of driver possibly dynamically. Sometimes a
+system may have many similar devices, but each device may have different
+attributes, it is better to use capabilities for such attributes as well.
+Examples of capabilities are resource limits indicating number of RTC clocks
+per device, number of flow filter groups, number of flow filter rules for net
+device, number of data bytes that can be places inline instead of descriptors
+for the transmitq for virtio net device, number of bytes in a header data split
+receive virtqueue etc.
+
+\section{Read only attributes as capabilities?}\label{sec:Creating New Device Types or Extending the Device / Read only attributes as capabilities?}
+If there are one or more device attributes which are read only for the driver,
+they can also be used as device capabilities. Such read only capabilities must
+be documented as read only so that driver do not try to change them.
+
 \section{What Device Configuration Space Layout?}\label{sec:Creating New Device Types or Extending the Device / What Device Configuration Space Layout?}
 
 Device configuration space should only be used for initialization-time
@@ -26,6 +66,18 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
+\section{When to use admin virtqueue vs control virtqueue?}\label{sec:Creating New Device Types or Extending the Device / When to use admin virtqueue vs control virtqueue?}
+Any new device which can model its configuration using device capabilities,
+and resources as either implicit or driver created resources, it is preferred
+to use the admin commands using admin virtqueue. This is also helpful
+to do multiple admin virtqueues in future if needed. Even for the existing
+device if a control virtqueue may exist for the existing device, extending new
+functionalities using administration commands is desired as it already
+offers a generic infrastructure for configuration.
+
+Administration virtqueue operations may be relatively slower than the
+data path operations, hence it is not suitable for data path level commands.
+
 \section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
 Device numbers for the new devices can be reserved by the OASIS committee: email
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

