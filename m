Return-Path: <virtio-comment-return-7520-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E49E6FE2F
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6E7952B026
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 514759866BD
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 35A7C98669F; Fri, 22 Sep 2023 13:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 476149866A2
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMztNumQCsG+y5D86AVggmSOg09SODlU7+iAwIWWmilA7Tf3Nzb048SN9FcD6eZJozBQgfuUPgJnXrsU3kZwbC/MnAwYlj7MioztbWIxpwYXKCNE1s/ND1mgyf1JXjrsTTo2vyHxOfzeAVWI7EdfGngxtveEhdOYnEQtzbMsDNSiVN9pNCpDdBUtiBn6TP9L9UHjX3riiNe+8alf0Ijhk+5ZxlrNEosCQL0cLrRLnc94kAqLSAEVpwIjgzrvG8Lb42ZBGmwuUB25PYt/QSQcvtH6bpGTyqOb6AmrXxEp+esjrGFjdk0/6Pmun+RgdMYqPc/SCnawnlPv73fRxrSqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tvz9IT2cKea0ezJsPzwwCdJ4cYy0m9mhEGVH7LgRyBk=;
 b=cJ3DV6RTqwlbXtObu7+HTTvM5bvEow9sZnbkRRLVFjC+RaqQqy5hlrLf2H6Sg/LgNI5SIbl1Ebkw6zIlRwFV7jt1UOp/RI4fFq7x6T3uN8hUJ8cHx6T+S1GtYFC+p3CGb5R1SyaUWo/KDfdyn55y6EJpHzm4iVjN8Ipzxk54F3Ui99a/WTbWlv5M1AIUdPGVgINhmIZoJIcecy15w+JIDiyrAE95xn0mYkjjj8ok4gXzvxOj80J4qs60NowxYnY996EZIGjncOxEY02QBhzvHuO+4lBT7eOK57xImDyZ21I1seI8Dccbevh3Qs/wjh42PnTjHRV1s4LhFIoU5xzRNA==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>
Date: Fri, 22 Sep 2023 16:48:31 +0300
Message-ID: <20230922134838.3718-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: e48e54fa-10c0-4b5c-1fec-08dbbb72ab24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IlQYvEvfSKHYhWkqkgoJWSsK0VEgzezVc7jqk6FUyqg9iCzt38ttFG3dBdKNJQdIkvc7QaaDPI/cy3KrnaYyz1S3LebzjdxXIDrdaEuW68iDLjssN3FBwqg84Cv5opd+/G1l1v8LYHEaxWtsoB5HOpbjmaBX540fcpyG+IQRvawNOaQCleYBbNLMiakOnwXWVSD0UfxQkA9KpfJAzf1n2Wtxi6JG/nTtfK/1kz3/gjxeHdEXvjoSF7LLDFtT4KgcvtNtqipbFDa+OaV+jsO+8PS3phMXt4uL5ktydkgu0Ig0k/YmCxJpvcxMgeZhnbxlW0ydqL7DydgS+4uhOX+axHICbLk0zYFO3tdSfB7+YfGxisKxOtAbDRVLx1nBcF+CaW/meoQ04yuv5sR207XBLNNLPSxysL1rEExFg+Db+ofpdbQRfEPUZvxJLMtnluY5fIFXlSfGs/IU6CCiy5xej4kAd/RlKRMDw0hX4Wzldpkn/zeKTFy74EEZDQIx76+wzVSsxn7K3ct02Lsl6OMBLkC0vCftzMfHCqEq8WCv46JwFLlOGp/7oZejbiQ1RGdTBo+X+lM5xwlw3JkXVkVXt6iclNIYgy0lCBXqytI+ALvtUqg7qPcH5bLazQtGHrJkb/WFa7C60eWbNgSuLvdLnZLtoF++mEfUsh4/L85fn9mp2PLfgs9QijPfgeKHWtltIcJuPdgO8yd3EIYn+ts9ZWtsFhVdZ/EdbEnwkl+HHGZLoG73TyZPpj5MJXkXnZjy9PzfidwmuwrwCkMYwGVfEmzW9uKKK2KjTU0TdzbU+hXBInSLvqwU3faq+XuEWkdw1iFaijb8oyu53EilWcnr8+kZ11cm3l1QN9VEfyFOwQY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199024)(230921699003)(1800799009)(82310400011)(186009)(46966006)(40470700004)(36840700001)(83380400001)(40460700003)(36756003)(86362001)(7636003)(356005)(40480700001)(82740400003)(36860700001)(107886003)(1076003)(26005)(16526019)(2906002)(336012)(426003)(478600001)(6666004)(966005)(47076005)(2616005)(4326008)(5660300002)(8676002)(8936002)(110136005)(41300700001)(70586007)(316002)(54906003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:48:57.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e48e54fa-10c0-4b5c-1fec-08dbbb72ab24
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
Subject: [virtio-comment] [PATCH 0/7] virtio-net: Support flow filter for receive packets

Summary:
========
This series improves virtio net receive packet steering to forward/steer
packets to specific RQ.

This basic functionality will enable Linux ethtool steering, Accelerated
receive flow steering (ARFS) as starting point, and more use cases in
future.

Problem statement:
==================
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
Flow filter as generic framework overcome above limitations.

Overview:
=========
A flow filter defines the flow based on one or more match fields
of the packet, defines an action like drop/forward to RQ.

The flow filters are organized in flow filter groups so that they
can be ordered when multiple applications wants to use it.

Flow filters requests can be transported via control vq or dedicated
flow filter virtqueue so that it does not get intermixed with other
slow operations of cvq.

Flow filter requirements addressed by this series is worked by virtio community at

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179

This series utilizes enhancements proposed in [2] and [3].
It uses updated control vq command format from [3].
It uses new _DYNAMIC feature to create queues when needed and
saves guest and device resources.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00236.html
[3] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00227.html

Patch summary:
==============
patch-1 adds theory of operation description for flow filter
patch-2 adds device capabilities cvq commands
patch-3 adds group add/delete commands
patch-4 adds transport set command
patch-5 adds packet match fields and values
patch-6 adds flow filter requests to transport via vq
patch-7 adds device and driver requirements

Please review.

Parav Pandit (7):
  virtio-net: Add theory of operation for flow filter
  virtio-net: Add flow filter capabilities read commands
  virtio-net: Add flow filter group life cycle commands
  virtio-net: Add flow filter transport set command
  virtio-net: Add flow filter match values
  virtio-net: Add flow filter requests
  virtio-net: Add flow filter device and driver requirements

 device-types/net/description.tex | 671 ++++++++++++++++++++++++++++++-
 1 file changed, 670 insertions(+), 1 deletion(-)

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

