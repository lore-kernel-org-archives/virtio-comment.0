Return-Path: <virtio-comment-return-8808-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0088BC35274
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 564BE2B045
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FAEB98647D
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B33E59863E4; Mon, 18 Dec 2023 06:43:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E0D3986478
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Dec 2023 06:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1702881799.823000
X-TM-MAIL-UUID: be7e62cf-41c9-44db-909f-3e3a74e37ff7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7x8xDWMEED+GleWolzEqYIn+ipQRPCL/7y4Il9Rx4oqRwAaoZdLaQv0cpn/sImrEae23TtfV4iVJqY+rRJDUZkCbx0vKCEhi5RVlvOvRtLSo96rnEkGcGyAjKLboFri+t8UCG64aJw5VUk7w3hHsuApBTLMTqkF1/rNXa1NGmoNHrkviwOmwF1WWmBa3wcuYjpfhPz8BfYrt7+X6yUJofSr4j6li24ZtU4fVKGZbVkJoDhhZBpZUUH1pop51NnJf4b3xxdxC+1+nAyZPEpQtomG9qorsDSTqFIq6gIdw8zsN3XG2calaCiF/BeO7V7ufgTDiFaI4IKOQdBofHVB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF3corhazcI37R0t0YIRLAHDWaUHuKlZT5rXgmYU6R4=;
 b=iGYhqZfPwf1ece/g9Aq+oYVzHu63mr5uyduVOZTrhe7LrtwTOTTzQZ2orlA3X6Yy6aqz7piKLJcxKCh7FGlKsjaJzQ6OKeRrHAqCZavNhMuBNAOypTERjA8mzJH6Q4WSQuCuwbiM1gSwk2vhZDYdmj5f3fE8/yy4h/XiSY4fxSp/wiRNprIaL1QUNj/+Xm9AVAIgzmaZ2SeLJ6NcSKJHLHWR4HTI+cB8vQQdzKYUEgC3Wk4zVr5+XyegxBmWNwwz7hOfJj5S5qimIhUuE3Fgi349ePM7oeKwSoVb1lUe6BDIcLfN7glirQhOcf3obcx/pmheeDfKJZDJHrwg+bV2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Date: Mon, 18 Dec 2023 07:42:49 +0100
Message-Id: <20231218064253.9734-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6EUR05FT025:EE_|BE1P281MB1636:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f1f6851-fc5c-4dd9-14a2-08dbff949e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PKu1Qd3AwVVr5PC1/ZFabMRVhk+H8WWvg0wT/KCDNZJImz2nGAXom5mzm+Otey20ccG2bpUFPHdbwj0FJJfoNlsliiVaLU5/wwV5IUc1ONMkotuLSbjNAEyGtuMIVljVPoJgnz+0r6XEP9mJ2KzIdcRMD+tUw4GYTSpcormvXFKKwRQxy3ZN2z5bkFnAw/Z7ZhHZVIEflto5ShxQsVgAwADgKjdtgI9BOW4bI2Y17A0xzOFYTkOl0ZnArDRJ2oxltQEjot1wj4m+RKp3SGbhqJjwJDlddT2bCtCVozfO59vx4omA2iBze3FkWj7KFCEqhl0vjCWheqmYrhT3xjfMK4jdjxwK4gKf2FErpUegzf3H8x0ubiFZZ32uTQh9f/Cevxh++NdmjEVn3YnOivlZzDMAnVD5VBQVsKLqm5oFNJBCFH53bisj7er3jApv3YnO/jhUSVFvyswgSW0c/Pyp9bMji4Fd6X4shmIM+qQB21ahdK9EptqlW6S1mSOPsZIzorbfMyQnKEwBLJYReR+DZAndwj0rCwR0RZh3PukY7hcWDJ+lLot73brZWqFYv7Vu6AUjp+X+lPc4M8d70LZLI72uvKfroYLHX9VGcIdiupEXrIXkNegkPlOboOjy/JzW2FYoPROFeXjuhM9NtSQjzpVFrcYNh5fiM5JrnQR+dUo2W/lEemaw9g1pw4rDL0IhKnSqxe6dCqFNKjN63Q5bM6W+nnWME1Gy6GlwFHKMQ2hyeFAiO62/ekkKbzkT1yF9pEg6aVt5kqpfp7LvCC5EVQKwHSZaXYI+UEIKqyAHcUs=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39830400003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(36840700001)(46966006)(40480700001)(70586007)(70206006)(6916009)(5660300002)(81166007)(36756003)(86362001)(36860700001)(1076003)(83380400001)(336012)(26005)(2616005)(2906002)(42186006)(316002)(8676002)(8936002)(54906003)(478600001)(44832011)(47076005)(41300700001)(4326008)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:43:17.7321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1f6851-fc5c-4dd9-14a2-08dbff949e3d
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM6EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1636
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28064.005
X-TMASE-Result: 10--4.301700-4.000000
X-TMASE-MatchedRID: HRm6PbbemxeUP+0hdpOx0gx+Jtro8ArbZK1SF2R3ediocjoCWfKow+R5
	pI4Y+w3PNLiWfBhc3piaJIV9vU/XdKf6bZ+Y3wNVJbc9h+u8l1ign19QHAlOzKRXLh2LRQgUQXX
	MAmTjzi9gu2uzUtHU8dQcm35c+hJowBDfgAwffVNGDXkz8A7dj4M+VZimfMfO4QpvGpvkj+eHbU
	QHMhvqjPuu9mlos2cbIj7pEBrP5E3HXSTxCrKgDBEuOqgkm3/1h7z+gmKKj0oDf6I8jFx+tqnNK
	w566zE4Va8qDALSuhE0zI7+eiZZ8FukG8Eldpz+xEbc8IVy0FPNaqGqOYpIeC+ItpuF9aroIVL/
	KOmQWs0=
X-TMASE-XGENCLOUD: b0065304-6429-41ca-92aa-cf7c7ca979be-0-0-200-0
X-TM-Deliver-Signature: 83017D5D6BF40A8AA3E3414020FADB0A
X-TM-Addin-Auth: 5KeHPoXzkn9U1RUo3dU901br21cHxOrnxPOYJYwBdnFFwj1SfOHOG3S2YD9
	G/eqeLn3kspgG+/C+WZlmh4DjS3bpdRpbiD/NAmQwmlH5Ef56430XsoFz/jPCWCX9VQwtZwHl74
	ArxMMfRCpeIJ6Fux5m5s+VI08GWjZtdbR84J64y2Qm9pJvTXa0chZDUNs643Vqct2XibjeF8IqE
	jk293FthdcxbruXGn7fjBrgO6ws6fy3mFbAfw3GKvV6mO+krzXtc9bqCoOOqviHYorGaUv9zpHU
	ZXqHbSPAVOzvEWM=.YuS2/8A3n7hrhQl8DHStjC5fKbX3c9vj/D5qI3v/JnU3i95gVqlstcq1hv
	rV7jfuQNbBqcce8ETElUp5HDFG/Q8nZ90v2WfUvWWj73xWpQKcXWyF0bAON0/AyJj8+8XTiATzO
	lStVkxpLkaCAasUOahf9lsQVxms9m2z51gDf4jX7/Es5bgsS+QiF6XxEwveZgNLl53bd4smGrvx
	RNnn9QDyBKPnZvWaOUyG0dtC2//R4ziBfLgkd+PO2Y0lgldHRAMshca5N2JPHTsjoxVHEvGMDUF
	2rBSR4pBooA+1XiTzZVbe7WsMs2BrkrWpsk6an0MCcEUhj5pjapiyk742Hw==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH v3 0/4] virtio-rtc: Add device specification

This iteration of the virtio-rtc RFC spec

- addresses the comments from Parav (patch 1),

- separates the normative statements into a dedicated patch (patch 2), and

- adds an optional alarm feature (patch 3-4).

Summary
-------

The RTC (Real Time Clock) device provides information about current
time. The device can provide different clocks, e.g. for the UTC or TAI
time standards, or for physical time elapsed since some past epoch. The
driver can read the clocks with simple or more accurate methods.
Optionally, the driver can set an alarm.

Changelog
---------

v3:

- Address comments from Parav Pandit.

- Add an optional alarm feature.

- Various other changes.

v2:

- Address comments from Cornelia Huck.


Peter Hilber (4):
  virtio-rtc: Add initial device specification
  virtio-rtc: Add initial normative statements
  virtio-rtc: Add alarm feature
  virtio-rtc: Add normative statements for alarm feature

 conformance.tex                         |   2 +
 content.tex                             |   3 +-
 device-types/rtc/description.tex        | 937 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |  13 +
 device-types/rtc/driver-conformance.tex |  11 +
 5 files changed, 965 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: 4cb03b12dc951f0152cd2cd9c79b24492e174e43
-- 
2.40.1


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

