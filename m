Return-Path: <virtio-comment-return-6082-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCCFC77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:04:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 71A09E6946
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 685C89867C9
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 56EA89867C2; Thu,  1 Jun 2023 22:03:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C3C99867ED;
	Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxovKvqOSjGBaI6/o84dJs5hvSmRQH05A45YMQO9DAzFLSm06GnNDUmNKwnfA7jjel5L7YKvZxYCsQFx0yHkTIrbIoD2To8ZDnyZzSSusAGLHw93KvPy06SSeeT814Bof/LECvTZziCADiUG90zvMwcPkwpjOL5gsYys6lRhr0dVVE8M0YVC2VMPHcSYIGbpt6Pl9qltNDs60L94pbXiY4JauNWWvCdOb+OKPSjN/bAzDd6TL/BWmyyBZi6loMBxbq51Lu64di1CTQ5CUxpQpJieGtuBNntF+lVBO6BrDCi7sWk5SJ0sPEvdjAzIWMa8vRzTvmiPHw4jypeW47ziyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=253fqTi+CTt+O+k0yYE5/trGjTCVlezqHRUMMJeKPJk=;
 b=c/Fk7MKD+XPguI194Vy6Yst7vaI4qQz8uKp4mWUOyOJlHOylb6LM6BGwA9mHeWWJrX9/3ZNqssAR+DmVpxEDk9ZakzFosepvMBrLsrrpHkIX0C3k3ENR+Xx6F/ndsOxTYwarQ2LoUgjLFpvRHFO7WUZdJwtLlOsrRDtjclWX9Q5Bzjey3Uhrq6wmA97dPMY9fJectY/yabapQtNL9uAhYnZg2dl+NLpDgaY7sR0BoBziMUuX0qA6TPQZ6aI3WcgJcusxJrybic0YMvJDnfKzX2dTwlGmMIiE+OV/SKK3FGefTfB+/oMI6IEcJwgh8yiLxGIunh5iesgpF+wSQU2xbQ==
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
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 2 Jun 2023 01:03:02 +0300
Message-ID: <20230601220305.587034-5-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230601220305.587034-1-parav@nvidia.com>
References: <20230601220305.587034-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb676b4-271c-4700-9f8b-08db62ec09a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46cD8YccHTk3+0Okc/GiDI3e5VEj7TRGDkigLmPVzAXvOBkJ4B1SsA/EoOuDWWMR7eXMTjkuhbsEl9pn7gT7o/QvyplNcrmeIrKWc3/dhGC1cWP8uJ/I3MOywAVL/w6NulVErxfLHLB4m2ea/9r5u67E7MT1F17J0MfO/7c/Cgq7qXPt4Rooyjd+iybTwODxusRVcxfBn1RnpKmnnVT+z6ggG28ENjtcs6oYalGunSgZ3827Ah94/H6EFQVYpq9RSKA6Gax0nSuHVyVeIJhwmoYWCaN5/ljCaNUsgfIqF6CZChbuJSdRgXe8TRqbKGkTqXOdrt787bBmM4ZbS9EjZAs/D/YfQaaLVquIMx05UPg/XwaPaJBnNSXTKA2gZ3froTXR27FN3nlkfFm3XhOpQLh7/1Vdo5ibo3jcxUGi32PQvUdeGBOfBsQx6HRQ7tR44EdqU2GD/vHfvQtoiMKD2C16A6W8ybmH/AD7p95m8HBB/oUaRve98zCMXGsepiOjG7CxKlNCe+Ori6YJ3RCBtlimXVl4gBqE5ti6sJIxg5johAPAE6+BaYCZQQrsOQsIH6vbwHfNTT4EaNfBFR6ZTphoQ65butRRmXbIv84mLVdU5dImc6hVDKBSl/UeDoTfp+skr296jFPdAdX1l7LjqE4iFpy5wSDoSHHUuU61MkWQoXkzXs70XSIx52QcVArOr1gO8nB+NANNE/dxhz3eRBspX6swGbW6RrF6JN4bDBJAqncxeBlKGEpaPliaigC9
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(6916009)(70586007)(450100002)(70206006)(41300700001)(316002)(4326008)(8936002)(54906003)(8676002)(2906002)(15650500001)(5660300002)(36860700001)(40460700003)(6666004)(478600001)(356005)(7636003)(40480700001)(107886003)(26005)(186003)(426003)(36756003)(47076005)(336012)(83380400001)(1076003)(82310400005)(82740400003)(86362001)(2616005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:31.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb676b4-271c-4700-9f8b-08db62ec09a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
Subject: [virtio-comment] [PATCH requirements 4/7] net-features: Add notification coalescing requirements

Add virtio net device notification coalescing improvements requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 054f951..fc36f31 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
 # 2. Summary
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
+3. Virtqueue notification coalescing re-arming support
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -143,3 +144,10 @@ struct vnet_rx_completion {
 7. The device should be able to indicate when a full page buffer is consumed,
    which can be recycled by the driver when the packets from the completed
    page is fully consumed.
+
+## 3.3 Virtqueue notification coalescing re-enable support
+1. Tx and Rx virtqueue notification coalescing should auto-disable on
+   notification reporting to the driver. The driver should be able to enable
+   coalescing after processing the packets per VQ. This ensures that when
+   networking stack decides to poll, no new notifications are generated when
+   per VQ notification coalescing is used.
-- 
2.26.2


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

