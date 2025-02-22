Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F478F2F
	for <virtio-comment@lists.linux.dev>; Sat, 22 Feb 2025 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740267059; cv=fail; b=F3TDuM0zCHfL1UD55eDu8gZSbn53X7Q2mqT9v2tP8VMZ7oyK2ZmB3GUOwOqn5Vxla9vi71uhfMom9BmL8otiBhEjWqy/0NO0iLtrhiR/mCrNtJhL3lQmUaULanCUNvt63f6Cb/FNwkhjZZgolJXP3zsBbJXXqyV0CZpkYaGDA68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740267059; c=relaxed/simple;
	bh=HaGZJ68MpSqKL6ieXfOLXwyHVufLiclHQ1UXxQLQ1wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=EWzW6VvSh0RwguGNLYhfohngjFPSwMYRgrTU62SW/5UjAibkp5wQ6Ad81Ef6DuBesyk/9u04MJVKU7zu6wTDnx9wwFTBOcqg6nWDu3TdgWuueZJCc6q24uZ5reDueJshBDY4CviEQDDeCocUA+o1HDUix92gWVK2sjqde6pny3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=rlq+JVmb; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="rlq+JVmb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zxxiy5AviEM0CNn7Y0bOLavwmefv8bOIjufQDKSMmjjOLhq6Xbgf7l/d/9PAletnXI32JACkgEdf48pUd0gsdRd+eqdgzHim9SFj6+TuJdfKtPSGZvKXh/nZL4z2+UlgG4sfdrB0hsYTcBCwoP29uFvHLqvC23hMXGaRXddOnyn/MWx2h/pPqQfOpXV0cnIpeSrUO0vHTv4wRMlVwXhlKeBFTnzNcwyJRQ867YfocBpkkhjdVz4H6cbt3JljKunR8P19Z6rAbfmq7UOIPWY47OboCKHufmEGUgeAIh7bPIrXuBOZqrHtiVbK98tJrEWkvC6UozmK8eRUUZFGGOSz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmqPtB6y4dLnXsHsmmStyPFhDSzKVeRtM/UOti3FkO8=;
 b=NDrh7Q7aizd2CX8tjDV+Enkz328/5jWW2PT1JNAoN5z2v3rJrulGKtztCY8lXswnDGGHxTrbNf0t8CXnohZnWUr0mcGYR+ar7Vj1s/OQkfbxOexguVAubT0wYa6B+JSEmePzArMY9GF0lsv+E2khK0ke9hRNfmu4o8ciVkQR8w6s+NUfW9XITotmuTqqqH83G8je3pQr8iUa4+Kn/g0+iI/zALlHScU42NM9STi8YA7cLA70Z1ojGMnWGgBxLZVHJDLfmsgqo4iyZZvw5AvI9O794vGMuERnijgr8p2oHodx2PauHT0vZl3Td/HtVoXQnLocOILgHwYWli6iQkIgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.29) smtp.rcpttodomain=apple.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmqPtB6y4dLnXsHsmmStyPFhDSzKVeRtM/UOti3FkO8=;
 b=rlq+JVmbEqcuaAyviL2dpPlsJq5Ge/l8Oiv9aUNA4GYvL5eSCaCGvX/dxxH7AZGSaSgqpkNfZl2CJb/s9d9gYJMmOLXLd+LbTK5vBBYy2MqlAtcDAoCCiODiWjJ/doApNz3X00/uyZZ5eb7zoHp304xPXJJRit5FmWfsKZTrhRhsdgcjPzLi6eBkOb21MysmJsJKdO/gGRaPeJwm0KQMwXrYPtiAyj5NqGDfrtdCHpNl2IjoUe84o8t/c/zvRCIXR5d3TKoPxk1zi9AspBAjOxF0tfuhAmkw+6FYC8FC66Shj3H51T1YMONWp3A48mAt08V1EW7U8qT6BuwzZTmj/Q==
Received: from AM0PR03CA0039.eurprd03.prod.outlook.com (2603:10a6:208::16) by
 AM8PR07MB7393.eurprd07.prod.outlook.com (2603:10a6:20b:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Sat, 22 Feb
 2025 23:30:53 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:208:0:cafe::49) by AM0PR03CA0039.outlook.office365.com
 (2603:10a6:208::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.19 via Frontend Transport; Sat,
 22 Feb 2025 23:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Sat, 22 Feb 2025 23:30:52 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 5C25022509;
	Sun, 23 Feb 2025 01:30:51 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	vidhi_goel@apple.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v3 0/2] Update ECN and Add ACCECN feature
Date: Sun, 23 Feb 2025 00:30:38 +0100
Message-Id: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|AM8PR07MB7393:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e9582a22-660e-4c2b-6c7b-08dd5398f267
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SbKGEME1VU/r/VplWl9HBCNbwC1cPziZQWlNiT/dWp3xrrlbmRcVkNMLGI7b?=
 =?us-ascii?Q?psqFqQlOlGz+SOJOz79R/h8msdnTlX/2f0cMMPJkUlhSMFQ8vm82yaubCWmj?=
 =?us-ascii?Q?u9SytHm6w4Kxhwi+T7+bo+pVaEKQQsvifXh+6k30Ug9fRh3IHOfP21sQnmmT?=
 =?us-ascii?Q?UhZw47AfmefWjQwh6MFjhWI7U6NChIs59w6+3S+eGb5a0kOz39egBRuzqV7K?=
 =?us-ascii?Q?u+U+uZVvTeoe17UNI/onBN4vpqs+6/kI1IeNMInKBHJv3FtFI8Fwln9yszwx?=
 =?us-ascii?Q?Ee7F9Mil6lsa0+sbGXWs6M3rlai+rJzzSypldS0sqJlav2y6NP1FHb/Hyd2P?=
 =?us-ascii?Q?AWk85Zrua9P4myVh+bLjH18kXvFFeGFl1+JBIpMLCE/hZaxaJdTEa9W7yHIE?=
 =?us-ascii?Q?JKkeF6oX5eXRJpz/QUICh2ewZsBmgdj7pf+hg921anMkovxOjW2eZ0X6WQu/?=
 =?us-ascii?Q?xzyebVbMEHwVCFZZSwgWHGvnxbJCYhWzrthB3DWQhrURvp4U8OjeD8GQ+3yc?=
 =?us-ascii?Q?q8+mRskZeUZ+rMPHPl6eBnFdZyRfrVeMYS5xC0SPy8zbLSYxIHYhm7hme6KT?=
 =?us-ascii?Q?S5BjHO1SYayLFJcNM3TS8LhFIgVTUL0qdI4jdHb8llyktr9IKJQQvew2esqQ?=
 =?us-ascii?Q?w/yPyTNLY5nZXFrn3ZbWAmLrZW3lkh8QwuDax+p8tWHC1fuxQ7qZ7rD8W2qc?=
 =?us-ascii?Q?LV92rEAGh0Rw/QIU6tlth1PAurcqrUzHpmg38tOYUHSSyuOh08gY4OdwQh+/?=
 =?us-ascii?Q?TapjvzDu79U7PrvoOWYecoJT+s4QcaF1PKIiFKiqXutMz2XXBKdgDAeep8+t?=
 =?us-ascii?Q?5qZTz72wodJfK7sPJsGsuS1k71MNa8WoRaBTalCjGSp737bfOTcAiehdZeeA?=
 =?us-ascii?Q?3qWEuTU8bdNpOVvMDF8T8a+Oa7tgQKtvVYVD6R+JSLeCMMIvCpG3H/4de/rn?=
 =?us-ascii?Q?HIRoVSxAudTFCVWFWQtWFM67jBwYUULnLtf8FEobNKMG9uTZGdV/Wrc3DhQt?=
 =?us-ascii?Q?KLnrc8nsOhD66r7dLSuFGXWgroulmz18CoCeLYiy5/JgkgpkSgF157L8fzaC?=
 =?us-ascii?Q?T/3XQTnOXuJfrIy4bvY2AAD36KvN3Dvf6t2qs4Sct/3jzfHJZdrQ7Q3uiugr?=
 =?us-ascii?Q?aQbjKAQ1IpahxMI2l49Tyq7VhZeAU2vNjOGO/adF+cDdY3N3lGBrbFWjMIQk?=
 =?us-ascii?Q?B/i1rAvct/uV1AVnxZJAAiZQL9EEBCsFg8yghUl4Fw7blma+3tziG1kvVRIC?=
 =?us-ascii?Q?MaZNkkuB+UywC+SIsZ53P0VfK43qyCYnwdJ4cmJQPIydpEJBTt0gsiJqwdce?=
 =?us-ascii?Q?rVotGV64kZ9wcZmHo8WfQhoHJ5wDurKfu3G5RvnvI5QwKNBxsxDNd1XxPlJI?=
 =?us-ascii?Q?RjgH8IKu41XhBo7luDYW3CKe7Mna6DyDl20QEPgh1K74QFtoP9fZgWGL2Ojc?=
 =?us-ascii?Q?/wEX5oKYiAUn+gXUmdIMByZYi6WPQ5s6ujRj07AhzXiq07JrRKlc4nS5s2se?=
 =?us-ascii?Q?oq9wnT96rl6A99Q=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 23:30:52.2539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9582a22-660e-4c2b-6c7b-08dd5398f267
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7393

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  Please find ECN and ACCECN feature patch v3.

v3
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2
- Reabase the patch on top of v1.4 virtio-spec

--
Chia-Yu

Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descritpion
  virtio-net: define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 76 ++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 23 deletions(-)

-- 
2.34.1

