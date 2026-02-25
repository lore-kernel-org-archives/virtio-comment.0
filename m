Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19A72627
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013779; cv=fail; b=EN/ghubSBfDwSseOhHZljghBsEleeB+xaKnav43+gsdo/Omj2jD9RuJK7t4MKZKtJ9BwDtLHkqaLVknz2j4kjP3MueU8SCBvjDU4ffh2ENNGEJQ4WzFLRjELtrJY2i4nZ2OiXp0MkxQT6XHIaQtCutYRW93jFDtaB8HtRqLc7tI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013779; c=relaxed/simple;
	bh=TK+FZyCW5pB1p51efq+jt16ZouQ9C2eVqFKo59jYihw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qvz97JRHJoMTbbbCP8m9NqgCW+9fFoVmJhRUSI0X/AKpWRiaA7m2S11PW6+Y4OtMyLc8yYP400AECOKYpOG16wxGniPkexOLsVkS6LSs+PzpfC2w8oWzltkHfEPQFmwV//dos/wNqg4E5Hrlrmod9uDG80OURMi0fE8cqHboM98=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PXoF8wuZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PXoF8wuZ; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PXoF8wuZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PXoF8wuZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U73MQmGs0XobuqxzNPzhSwa1pmxnmF+RTWUPo5yVTHnb5R5DcwcAC8sW6fw0pOC6+sbaJb7O2E2LOvG8vlmXPhFnLCSlyXgk+65toTYrWNQ98AtmAaB41p/pbQAtekhnMI4C+UvHMuWxn+652JtVcy+vOs7lDX7DiR0kG927NHVbvO58mMXm88ow7RiZBDL13yVNefHYDtvNJY755PAraqDnn3EscXWihgUok9AC6SJ4+ooQgZzI1RwUNviQeqv+5+NIZ7gJSu8s+ARRnBaSOLZlj6TIzOvSjqNj61fNLzJq2QB1aOhwlE0zESOADHlZ0Dze1/fqmpqw8I0QLWsPAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sq2HC+ZNBqfoujQOWffTOw0U5vIBGQoIXVJmTtHGs0=;
 b=To3C4g1I4vf2+XF1omCPm3iQWaD5XEkwUzFJr3TRedil01RTkfWY6zZqqosjD98D01bbNX0PpBn6H2al2nL7UmpJbJGfKPGragAcxHuwG/ocC0sU6YJ3luYmWvbBLeGpQEDjSN/EKvDEgVPxGlhzAJmtet7nLERCYLhtq9ZqpvyZXpr0AjUEA0D7+Dgx9UM7dQLcGwj0qRKiJWRBawm9yiqZjrrIqF+HjC80ZqQIXNo2IhkC0D82kyDpyjCgIN6GZ0Cv+OHnYr0S9eWygC3Y4bk9SVQr+5Wt1PsmO3L4Y8UBwD9WXMkmDJRR3baIBdB/MsCeoOubJk9h+CGMLUK4Sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Sq2HC+ZNBqfoujQOWffTOw0U5vIBGQoIXVJmTtHGs0=;
 b=PXoF8wuZ0rjlD5zMBmAuWRjzn6Ea2XszWStIFXsS4sG7E93UG/0v2M1l7HkxtPjIsWiGIrNUK+wf8Uym5494aFvxS5O78YBDNU659KbDDG4v4+NgSh4aijvvpTLrYo738jIBmSlRRj60T9T1vVK0DCdyAQEmQG8tR76Lp5JTKVg=
Received: from AS4P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::20)
 by DBBPR08MB10842.eurprd08.prod.outlook.com (2603:10a6:10:533::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:02:50 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::6c) by AS4P192CA0022.outlook.office365.com
 (2603:10a6:20b:5e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 10:02:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 10:02:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rod1JdQJm9WOs4eSeNymNzrgsqLZgSYOfeNqBgsxlWEX1TXk//gV70GKdts3hwu5LhpfZ6RXcMhRUqb0jSXS591+t+onGPNg47Hg/K5rLNXS3VBsesGUejhWc2LWAo+WkOVI+BR2l59ZlcN+q0YIU1l3IV/jfaweepwCe6ksrkaNhrw8UPkTfuAXU7+m8TdEZaqMRMbDVDF2vcmfpl6yRbkjeD8IueTpDfObvjN8aix9s3X7upcj9H3FfxoLPuxqPukMg4oiCiNwp1ydaNCOd63Yl3MXcmSnwuL6EiYP/g4POTVEJHSQJ5C28AdaSR2EcoavzkAJ/GKEveGJ6lXUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sq2HC+ZNBqfoujQOWffTOw0U5vIBGQoIXVJmTtHGs0=;
 b=wSM4LYs5v6MpxNrsqt7RHEdH/SZXZ5JoGl+X6ms+WtZc679YjMXtnz6J2rrwzjdKD+LLGF5opzh3lQa5Faw+94wJEWrvu6f+9oil0fUYKcXm3h/PWawX/qj00owrEQysiEOC/2SSmG520RHbW5xaoFKExKwIienZdhmVhH4pFjJnsHovmAqMRAy0ud9+EbfV+E0tpZsNNVd3fOU9OEDo8idnfybULUdSqC+L0P+BRyVjJ6htpaURswYxkVH47gSKXQk9ru92m2M3Ok4riinP+08SDSSC1m1WWqo2lJ4fQVC5V2JF4rzzmHFD2/jT7Dw7I4V77WjypPHCAwfMr0T5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Sq2HC+ZNBqfoujQOWffTOw0U5vIBGQoIXVJmTtHGs0=;
 b=PXoF8wuZ0rjlD5zMBmAuWRjzn6Ea2XszWStIFXsS4sG7E93UG/0v2M1l7HkxtPjIsWiGIrNUK+wf8Uym5494aFvxS5O78YBDNU659KbDDG4v4+NgSh4aijvvpTLrYo738jIBmSlRRj60T9T1vVK0DCdyAQEmQG8tR76Lp5JTKVg=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB6636.eurprd08.prod.outlook.com (2603:10a6:10:250::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:01:47 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:01:46 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Parav Pandit <parav@nvidia.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAAQBkAgAeJoYCAACXOgIAAH9QAgAAA+YCAAAOXAIAABWAAgAAB+IA=
Date: Wed, 25 Feb 2026 10:01:45 +0000
Message-ID: <68274D80-562E-44D5-83DD-34BC2D750274@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225022229-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225041945-mutt-send-email-mst@kernel.org>
 <701B1A68-655E-4ECD-BD17-5784AF7DFE40@arm.com>
 <20260225045338-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260225045338-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB6636:EE_|AM4PEPF00027A68:EE_|DBBPR08MB10842:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb910d5-db9a-44b6-4e20-08de745508e1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 0u5kHHqPTtAMyWqNr8C3vZBps6Xm+LFEDL1oG5vmNm05yumSZThab7uBRNjOGBFRtE9YWpCUey4XSiZY46lb6lEMk2AjDboH+2TIRljGXb2/FqwMkzYJXvdD5Wjmg3oqOfI1Nzdt8QPVZq8BmV76i4HuKRONYy9Pn0R9PaDWe8rjCQN1pcdrPZ5L09rlX6K8sVHncGshRafF95RfsrqiS9OuxU4fW/CAwpmGauyRVA1qkYcun8lyNrMduOTsdAfK0sx4XzOEVk/7abz/9NAFckN3Tgv+g6sHWO/XS3Pcw5mFcEVBXz32oDUVQHbwDLvExd4remnEhIQ9+3Fp2XCKc885ENC3aKJAm6CPDqBMj/Mf+sS0zA3UtQTi/HSoZd1wwmnSQ1D5bFB/8h3QlS6scKJPi9byJnoVxRY77ws5It3qqH7Mj+chrvCwo6zgL2rZTFEZrDSFeGlu4sKBKcyYlph7MZbZvY8BydQyBLg/gWSFUHM0bLq6L+itjCPz+Z2jHpab/XUYFiY55g7SS+vsJf1ZzQd1ccLFwJ4/ZE9raGdjZJO1NANWeK69/WLUC2qt77n6y/znQaJMYsuloaNSOtzZSJgEF1tu6Q38uWGwdFAiydTjMubiEzbnEgBSzmhszYCAHs3Qq0sTwhI6gbWz6pws2aCOPug32obBySkTYB8qencWrF/VEAMDCcplHRPvIiU/gh07swo1em1Z6l+RuVVBPpY5ko8h5I4MHzpfXZNVaD9DdNZF/73gqohDH6pBEtlc2HAdmfOHHE7k2krFTK87PPA6j1KcJKANd3e2GjI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1CE08D270CEB44FBC15E8B27EB05013@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6636
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6664e437-a184-44be-369d-08de7454e287
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	eg84H1jsAHD3SEAAQ408caIxbSw+y7gMPRfTZpBqQo+E4IhqxlWKLParl3RO9plOQxiMJyEQhJCZI3NRNWBbcw6jqU5B700comU7OWA/+UTBQS96+Q4RnYP9Thxk+6QB3lCj0Ro0hN3S2XYfhMUmd+I2Iu1s5qEeCLgOkl21xZy2zEt3Yazm/NoC5wG07bVVZfFquJaO99iYJLIS4EgWBxAHYsuN0IesfqQBSZx/ihiTs121FkteSR4apJOImb/dALSMy3TMtmD6BVnWGMOozat4ykMf9Ja7Yb1AekcZ2oi1iSctHk55fRpPxoANmbnU+z+5TPmTnggH/XRAskIBrnOIV+ZRojOzqNUp7jb+Z0nWI9VPQLqjsazzUrbaCl85cW7AQO99h6XfAJ94r6rX2t1wvq3d+UQfUpMm0D0AjNuxbSH2cv0s87e1dqX3jhJ19KI2gbtxMRPRtp/L7TmTwDkzW6oeZEK+Tub9ep/YDSA6F6zC6GLMaSkfsGZyN4uVmhna1CDc4Es6AerOqJkjBaBHInC72TukVykL2BQeBfncAMacfiL/XTxSvk9/5EbAVKxoGcs+M4fgW6Tn1AtCER5OZCCbSHY7mAHqVVXVEuAmQHqM+pJVrWK7GB3PjoUxtSksysgNG+QU826VT1dcMnpGX813Rt9Ox5D1vcMOGJJB+LMFySQlYho9lxUlrLI4WYxIFEmX8Ah7H5Hf7dCNhhDTxK1FQQ7vX2j+S5cpBGU0EJM7Ytlosdxvd4xUBhcuAT7yx9w1JjIoZJHaq4F04Vs5IGAOr13ZTLmtS7Nz0axY/G39auPvmdgZV9Elsmfmmln5KzJF9B/Hfye1mPj//Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B8ZDMVGHetP2tj4z6USxCOjX6xYKfGk7pYQ02ia++ADKCzEvuO3KY5CfBR78+WI+UAy/WYXleQZMaJTKhK/JRciawr0qySsR0NvjVuX6UR1q1UPhIDUxczX8DwnufPgFvQ7utMxJaIws7nWBsECrJt6JpdnwIVhq8qFdM+G3aqAfSQTjqEs6PDiL41W2jnBJ/mwFDfzzbQhKeRQ2fnBFrBjf+96q+xDodeP44nG1NRFV+sWFaA7d7bEB3hP+mjLGlHQGSQdt1lH6gHlzf+F4VlJTWYfJQYlk5UP2FH4PtgWoMtddmiIwTuRivgG6InD15QejWlZLonGjm5ZJL9wWPqpBqx4687mrIp3/ZiqV9ELEEYFJFGF24Wo+yAvM5eFkIotqwXEJ0b/rPK/2nhXrsrh7sawMyT6Uio7ssxT8/jQl0RwwIp6B1OV+MbIQD4qL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:02:50.2285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb910d5-db9a-44b6-4e20-08de745508e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10842

Hi Michael,

[snip]

>>>>
>>>>
>>>> I frankly expect an ARM FF-A bus binding transport section in virtio-s=
pec.
>>>> So that device and driver can inter-operate implemented by two differe=
nt entities.
>>>> Only virtio level messages do not seem sufficient.
>>>
>>> I agree at least one should be shown at least as an rfc.
>>
>> Here is a link to the current virtio message bus over FF-A specification=
:
>> https://developer.arm.com/documentation/den0153/0101/
>>
>> 1.0 Alpha 1 version in sync with this version of the virtio message spec=
 will be released later today, you will be redirected to
>> 1.0 Alpha 0 version until it is  which is in sync with the previous RFC =
we sent.
>>
>> Regards
>> Bertrand
>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
> thanks. pls include that in the series as [PATCH RFC 5/4]
>

We are not planning to have this included in the virtio specification but m=
aintained by arm as an independent specification.
FF-A is an arm specification and as such virtio message bus over FF-A is ar=
m specific.

We can reference it as a bus specification example in the virtio specificat=
ion if you want (as an external link).

Regards
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
