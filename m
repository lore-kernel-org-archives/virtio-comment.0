Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD727FD5D
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 07:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089360; cv=fail; b=knFlQ9BraEzri9U/KZsJ8J/TUuLDp4UELM0In+mOpukiOaatxfubYLnRpJqTiu77bxJFuFVjkRna9Djlk8qDEMU/dTgWEF6GRhswzPLts/mR54eqAz1PnPNlcz7UstN6AK8ACmxBspTTWrhSEOl7P8rh7cXtppDpKeaoMhQLtQY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089360; c=relaxed/simple;
	bh=Zw8Z4rTFmKOgLGC7+cik9586Z+E8o0fTTMoZgc7B1TU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ovzDwqLQ3i4ZF8KpTNxVXJ4iTKKc7vMMVFeukvRmbRktUPtWdkKMM47YuTH/3UB9Fmfrn2lHVaAL2UsGj40FlDman6ZRdD9kPYZqbHlO1FXduGqYT5YbaGbuCvr42S4RMiN5thE78Gl06TMoRBJXenPouSnpQqpKSCeNKYgPwH4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=d6wQP/UQ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=d6wQP/UQ; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d6wQP/UQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d6wQP/UQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qhdvouIFVGmajqhxkVb6LuwDmp5OVM1nDrzx42V62yBwNf/Qv3RCZ25Y1vqNsGbZat3hVp/kfM9n91O7XayO/A8Z00hrqSudNEMRlMGFdE88dU6lNsvPvT9PJmmMP9VjxyyekRr17p//aOjvJOmmc78pJNdicsc0G542JFTOXFljdwjwoedaHYEbbst+rg5Aq2Qk/+2fP+kR0n+fJW+6JDGykabqiLDtBl9/w25hlFrdMpNroWNuGmo2ni4BP0IQNYkWZrkSI672eXTEYUqacvgW/Q/4EHgwyVsw7wyHWtkFivAmY0DynsWDDY3/xQBlVS8STAs0TafB0A3oXyRMTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw8Z4rTFmKOgLGC7+cik9586Z+E8o0fTTMoZgc7B1TU=;
 b=hsX+yVDCX41UPDrDtpEBB0I8A1fUOE/D2kNt30MTz2NcYyxBVlwHL9qbsLvRX0nC1SSmnVH4tSI8sZz/nbi6KycBAhIWdMFXoLpWLps7ESq9lvhTxJDYNxOF3K8mUAAh40JoGmYJrFN+wzjRjwTt0iz5gp00jFvl/CQWgMZwjHLbstWTjGZQj731ZYP7vyYHdPpJdtn/vM5WmuZIGAk42Xc75h5A23unDzOuWoFulJ+qHNw6gaYW9AfHZx4JXlQtQ3J2xrUrxOfY+gx97AMj2z4LmDyqzStgjmZqj3q/qFjqcJusqLQaMUL4jG9qJTUuUGarIdvLzuwOAXtA9KSGGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw8Z4rTFmKOgLGC7+cik9586Z+E8o0fTTMoZgc7B1TU=;
 b=d6wQP/UQq1gDn2g0c0lzM6J+CnVWlVA5ltHaoPQgNCQ/ZecragiFUKa09hdBx8czVYYu4hE+/OsCAMaTOM1ej9iLsGvm63SoG9OiSDi5RdSTO7dN4pYyIEmQCbfC0T4afFe9GmxfLlFB4nsTK14WHhdAsGN6HdBww3ehBZxjTog=
Received: from AM0PR02CA0183.eurprd02.prod.outlook.com (2603:10a6:20b:28e::20)
 by DBBPR08MB6043.eurprd08.prod.outlook.com (2603:10a6:10:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 07:02:30 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::99) by AM0PR02CA0183.outlook.office365.com
 (2603:10a6:20b:28e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 07:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 07:02:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEp5uJkmE0SHz6Rq9/Av2cLmq4OvD46aTwuMWHWA0iJ+C37XhxUhmiUkxYrIJs4RpS9j08vWS9QIfhzkE9IE9MwQ9tisL2FxTRIRi7R8pnoglYF7khP++pKzj8SkbPrALWwSOF6EntJajFyFxgi17O26xic6kaNLdTIs8mqxSotD9V6b0tOr9l0vXzgLor8aVWB+jvDzKwfa721GJw5qePlrGsb9TwUXSyRx21QhQzZnCfkPc1xvJVyYYWN6KUPyHJhXy1d/gSbIEApepIsUBqZVPzL/xWWoBr6q4NfICamzMK9zVf/3RMQhW/CKOmIE3D5N3LSgube69Th03MItJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw8Z4rTFmKOgLGC7+cik9586Z+E8o0fTTMoZgc7B1TU=;
 b=fgMhQmH6Ne4T38bWbNcFSfcDqDBFwKYhS+/glFm8MHh15y5VkrDMKoIK0swHryiBQnmLJiXRfmoA4xGrp5bFb8CRpwzmo92Q5/idFZXhHvGqQXk4vHddvCC9L3UsD7Kyi+VzsjOJ/9lrVIJJGnSzKTPKvjLcgh8tU/tH1amZvghuN0cCIJ7/A6lMC99gkZj/yBS951JKDAVaLeizywSU3z87qoj3em6533R+8JtAkELzjG17HCEQ+SCHcAK5gypZsoa8Gc6RZ4V9bCuF3bBCdagFoMNyAT1ICrSl6Kn0/BSvxhgAj0upJxn2i2T5vqVl2A3hPT5OJz9tiEm9AlL0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw8Z4rTFmKOgLGC7+cik9586Z+E8o0fTTMoZgc7B1TU=;
 b=d6wQP/UQq1gDn2g0c0lzM6J+CnVWlVA5ltHaoPQgNCQ/ZecragiFUKa09hdBx8czVYYu4hE+/OsCAMaTOM1ej9iLsGvm63SoG9OiSDi5RdSTO7dN4pYyIEmQCbfC0T4afFe9GmxfLlFB4nsTK14WHhdAsGN6HdBww3ehBZxjTog=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9534.eurprd08.prod.outlook.com (2603:10a6:10:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 07:01:26 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 07:01:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAARd+AgAABNQCAAAEXAIAAAdKAgAADGoCAAAEvgIAA8G8AgAAXw4A=
Date: Thu, 26 Feb 2026 07:01:25 +0000
Message-ID: <7C1E61B4-8405-40DE-94D4-21E9B7C22399@arm.com>
References: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
In-Reply-To: <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9534:EE_|AMS0EPF0000019A:EE_|DBBPR08MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 410a0b14-0850-48ba-95fa-08de75050243
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 B53gncPAmd3zN3pVs4vUGUs2NETwKueADhEFdEAsMneGU7tnM+kCf0cVM9p1qDW7+6DzWofUilpQ1qmL+B3GhQFSKz09qJQZp5uBvWeMshS0wy5ZXE7rMPbMGjbHavDKNCXavLipiZ4BzTHcNdVnhsvoVvg9w58wNIbSX9GseV1sSE6JoQ2zwTY182JMYcBg+5t7GTo2FQCCnGF95bDWOHue8RaAahjHEX9zlHBjsFv5ILo3NjGQI9peeAZgyZM/ZS3SZj0hGJS7JqI5QxNTGNeCnV7NutJGHGUa1yNfk1ZxGERet5EQJGNJg6gPzlDehZ0hd2RHEIlaDJ1EUobjXSI4TUpwHJE02leFZ9PS9abgkVSzGvL5UWDmf5tmRYKC1VWEEqyFaV7stduKrDSFla4i/+s31m4vySqWYENRWLic7C92KoKmaNnkNkPLir6wB5NTN8c3TO283BJRty9nuslTHFf9kIOQDdjmNuY87AcMMgB3/DiBytnpL17LZZ+kM89okYyH475aRzpRjRui/1pkQkWXxgYhE+cYdKhRhTOgicjsld0DRK4Nqs3yG3sbEcMc9LJLrb9zo4z4tzEqOQdFMQiGX2te95izAKKS+2dq0y1FKOPpm67zB2VUwcifiVCQWxh5jfU7cZigZsilbGWpYEbk+GmaRZ8glw1cmBUSfCbWMM1vufr8VAqm9mSBOu2WyGdxuKUGySLx1SBeKlqUx/XKuwwTl8qEnUyD01Pu7xh/DiWmx/yetgw9qoQlpskQ56NWJ53DsiM1RMVFq8XfC5dSbgmtvuZHkTPGgGY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <155B0F652F413F4081FBC351C4D2BC80@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9534
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6dad7b21-f5e5-49b7-8d4c-08de7504db8a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	NC1XynEFppThMZtHi5F503wKyqKU2ek3WIzLNxEB5q/sPTsm28WHV6PHwMAsaEWJv5Ew8OiBwblD3sXNcWJZU3FMNseEn2pTzEbe9w74NgHodo0scgGHn7FUUzLjHvtvPrWxU/FpI10iPd/tWMAh56hZE4+xunrw01UxFQOKl6gTLO5D5dbb04n6SMK2yzoYa/MMEsdsfX2IQ8DyDqjdr+7I3DXRZS19SJymJlHUWTKXNaPgWbzfDhqkZ0O1QxLT1kygwO+yey2zn3Mx2FwVzfWVtdEHf5XYm7WvH14znxnL/paBx5ct5f0aMh0Bi0SuEzu0S0O012YqUPN4BV+Tc9KBkFhgzOI+zDXZ6jIFMCvc641lvSaaQVnaQTFb3OATofR1WLcusLNne7xtewPweA582KkenvPHO+zEhYl20w3dEKtCCkBNqdPsrd/l0mIXnbjMvpmGjgu1RNhC1H2i6AV7Zl6HQoBYwTGGSHpdvMIpYv2X+UCkBBy7wUfjztagU0D+AwtZH/T/a5LA0Q0KYr6luUJ7CnWpFy4JVk8veVf0hZ3xQbdvaR62cl6qAlotgjDW/NfQIgObCqJD2WvvfzTk6cWu4XsRx1iIQxeo6EbWiZilKAtU7MGYaym3xG1MUEuHzRl3HQMCVMRpOspPJa59i2VvEB+yrCOSawbFdypHYPSUXyvvE+29Dx0QkRxHyIbpPJpnVz8R1LsjkktOuXCsfrwVB2PoZFno9gtErGlSCPP1XluJW34yF52AlL7sbgrgnOIoqwMMtPNU2HV1oM6edu9f6gLLaWg3toPbfN6tzJcTts8ePujXl8Wc1KGBz2iGCF1BnvZUqgmUw3bErA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pDVobAone8QPZAaFfYys3xdZNLc3AsoFNfzCyJLFHw4yCbEYwnjpre4ALDzIpsmrY+SflvbKBHXFRZNv0mHkAqDf6BbSMIkEuFB5xFFKK3Zr5o7DAcgd2mHy01q8DgcKHDqlIL/uGq8hui72lrJFLlrnJ+i8AGH/FSW6YbyC5MeqaibPQz3B1QRq8wOkUc1hRTNy7jf810ySTRyrOiFmlD9swNIAL2fbiI49peKllmUT6Df9Ibbniygqb+dYP+0g1f4Duzicly8FZRdz8IoNWllnj+gJS5ywUMs5yKhyfvcLGRFklZO9uF6AbBNHxXiwZUDvckpS9Er3Iaz18BP7k4Nz0mCRabeUGmWymRQKigAjZY2XUIIpuKLk3SjsOHHlYiL6SNEEF/pSRymhldd1HAhkePh25qilHrViHbyQprxP4hao5L/kJb2yUeLKH63a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:02:30.5354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 410a0b14-0850-48ba-95fa-08de75050243
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6043

SGkgTWFuaXZhbm5hbiwNCg0KPiBPbiAyNiBGZWIgMjAyNiwgYXQgMDY6MzYsIE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiB3cm90ZToNCj4NCj4gT24gV2VkLCBGZWIgMjUs
IDIwMjYgYXQgMDM6MTU6MzlQTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPj4NCj4+PiBG
cm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4NCj4+PiBTZW50OiAy
NSBGZWJydWFyeSAyMDI2IDA4OjQxIFBNDQo+Pj4NCj4+PiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBh
dCAwMzowMDoxOVBNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+Pj4NCj4+PiBbLi4uXQ0K
Pj4+DQo+Pj4+Pj4+IFllcy4gVGhpcyBtYWtlcyBhIGxvdCBvZiBzZW5zZSBub3cuDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IFRoaXMgaXMgYSB2aXJ0aW8tbXNnLXRyYW5zcG9ydCBkZXZpY2UgdGhhdCBuZWVk
cyBpdHMgb3duIGRldmljZSBpZCBpbiB0aGUgdGFibGUuDQo+Pj4+Pj4+IEFuZCBpdHMgYmluZGlu
ZyB0byB0aGUgUENJIHRyYW5zcG9ydC4NCj4+Pj4+Pg0KPj4+Pj4+IG9rLiBob3cgYWJvdXQgYW4g
cmZjIG9mIHRoYXQgaWRlYSBvbiB0aGUgbGlzdD8NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gSSB3aWxs
IGxldCBFZGdhciBhbnN3ZXIgb24gdGhpcy4NCj4+Pj4+DQo+Pj4+IFN1cmUuDQo+Pj4+IEFsc28g
cGxlYXNlIGV4cGxhaW4gaG93IGlzIHRoaXMgZGlmZmVyZW50IHRoYW4gU1ItSU9WIGRldmljZXM/
DQo+Pj4+IE9uIGEgUENJIGRldmljZSB0aGVyZSBhcmUgc29tZSBjaGlsZCBkZXZpY2VzIGV4cG9z
ZWQgdXNpbmcgc29tZSB2aXJ0aW8tbXNnIGJ1cyB0cmFuc3BvcnQuDQo+Pj4+IEFuZCBhbGwgb2Yg
dGhlbSBhcmUgZ29pbmcgdG8gc2hhcmUgc2FtZSBQQ0kgQkRGLg0KPj4+PiBUaGVzZSBpbmRpdmlk
dWFsIGRldmljZXMgY2Fubm90IGJlIG1hcHBlZCB0byBkaWZmZXJlbnQgVk1zIChzZWN1cmUgb3Ig
cmVndWxhcikgaW4gYSBwZXJmb3JtYW50IHdheSBlaXRoZXIuDQo+Pj4+IFNvIHdoYXQgd291bGQg
dGhpcyB2aXJ0aW8tbXNnLXRyYW5zcG9ydCBkZXZpY2UgYWNoaWV2ZT8NCj4+Pj4NCj4+Pg0KPj4+
IElESyB3aHkgeW91IGFyZSBjb21wYXJpbmcgdGhpcyB0cmFuc3BvcnQgd2l0aCBTUi1JT1YsIHdo
aWNoIGFsdG9nZXRoZXIgc2VydmVzIGENCj4+PiBkaWZmZXJlbnQgcHVycG9zZS4NCj4+Pg0KPj4g
SW4gdGhlIGV4YW1wbGUgc2hvd2VkIHRoZXJlIGFyZSBtdWx0aXBsZSBkZXZpY2VzIGJlaGluZCBv
bmUgUENJIGRldmljZS4NCj4+IFdoeSBpcyBpdCBub3Qgc2ltaWxhciB0byBTUi1JT1YgdGhhdCBk
b2VzIGV4YWN0bHkgdGhhdCwgb24gb25lIFBDSSBsaW5rLCBleHBvc2VzIG11bHRpcGxlIGRldmlj
ZXMuDQo+Pg0KPg0KPiBUaGF0IGNvdWxkIGJlIG9uZSB1c2VjYXNlLCBidXQgbm90IHRoZSBhY3R1
YWwgZGVzaWduLg0KPg0KPj4+PiBJZiB0aGVyZSB3YXMgbm8gUENJIGJ1cyB3aGVuIGltcGxlbWVu
dGluZyB0aGUgdmlydGlvLW1zZyB0cmFuc3BvcnQsIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gYXZv
aWQgdHJhcC1lbXVsYXRlIHN0b3J5Lg0KPj4+PiBCdXQgdW5kZXJseWluZyB0cmFuc3BvcnQgYmVp
bmcgUENJLCBpdHMgYmFjayB0byBzcXVhcmUgb25lIGZvciB0aGUgb3JpZ2luYWxseSBkZXNjcmli
ZWQgbW90aXZhdGlvbi4NCj4+Pj4NCj4+Pg0KPj4+IEV2ZW4gd2l0aCBQQ0kgYXMgdGhlIHBoeXNp
Y2FsIGJ1cywgd2UgZG9uJ3QgbmVlZCBhbnkgdHJhcCBhbmQgZW11bGF0ZSBhc3N1bXB0aW9uDQo+
Pj4gd2l0aCB0aGlzIHRyYW5zcG9ydCwgYmVjYXVzZSB0aGUgY29tbXVuaWNhdGlvbiBpcyBtZXNz
YWdlIGJhc2VkLCBub3Qgd3JpdGluZyBhbmQNCj4+PiByZWFkaW5nIHJlZ2lzdGVycyBkaXJlY3Rs
eSBpbiB0aGUgQkFSIG1lbW9yeS4NCj4+Pg0KPj4gVGhhdCBpcyB0cnVlLiBTb21ld2hlcmUgaW4g
dGhpcyB0aHJlYWQsIHRoZXJlIHdhcyBtZW50aW9uIG9mIHRyYXArZW11bGF0aW9uIGFzIHJlYXNv
biB0byBjcmVhdGUgc29tZSBtc2cgYmFzZWQgdHJhbnNwb3J0Lg0KPj4gU28gSSBkbyBub3Qga25v
dyB3aHkgdCtlIHdhcyBtZW50aW9uZWQuDQo+PiBJIGRvbuKAmXQgaGF2ZSB0aGUgbGluayB0byB0
aGF0IGVtYWlsIGF0IHRoZSBtb21lbnQuDQo+Pg0KPg0KPiBJIG1lbnRpb25lZCB0aGF0IGJlY2F1
c2UgdG8gcnVuIHRoZSBleGlzdGluZyBWaXJ0aW8gUENJIG9uZSB3b3VsZCBuZWVkIGFuDQo+IGVt
dWxhdGVkIFBDSSBkZXZpY2UuIEkgdGhpbmsgaXQgaXMgYWxzbyBwb3NzaWJsZSB0byBleHBvc2Ug
Y3VzdG9tIGRlc2lnbmVkIEhXIGFzDQo+IGEgVmlydGlvIFBDSSBkZXZpY2UsIGJ1dCB0aGF0J3Mg
bm90IHRoZSBtYWpvcml0eS4NCj4NCj4gT25lIHByaW1hcnkgZXhhbXBsZSBpcyBob3cgdGhlIHZp
cnRxdWV1ZSBjb25maWd1cmF0aW9uIGhhcHBlbnMuIFRoZSBkcml2ZXINCj4gc2VsZWN0cyB0aGUg
cXVldWUgYnkgd3JpdGluZyB0byB0aGUgJ3F1ZXVlX3NlbGVjdCcgYW5kIGltbWVkaWF0ZWx5IGl0
IGV4cGVjdHMNCj4gdGhlIGRldmljZSB0byBzZWxlY3QgdGhhdCB2aXJ0cXVldWUgYW5kIGdpdmUg
cmVzcG9uc2UgaW4gb3RoZXIgZmllbGRzIHN1Y2ggYXMNCj4gJ3F1ZXVlX3NpemUnLiBUaGlzIG9u
bHkgaGFwcGVucyBpbiBhbiBlbXVsYXRlZCBQQ0kgYnVzLiBCdXQgaW4gYSByZWFsIFBDSSBidXMs
DQo+IHRoZSBkZXZpY2Ugb24gdGhlIG90aGVyIGVuZCBjYW5ub3Qgc3luY2hyb25pemUgaXRzZWxm
IHdpdGggdGhlIGhvc3QuIEFuZCB0aGlzIGlzDQo+IHdoYXQgYmVpbmcgZml4ZWQgYnkgdGhlIG1l
c3NhZ2UgYmFzZWQgY29tbXVuaWNhdGlvbi4NCj4NCj4gV2UgdHJpZWQgdXNpbmcgdGhlIGV4aXN0
aW5nIFZpcnRpbyBQQ0kgdHJhbnNwb3J0IGluIGEgZGVzaWduIHdoZXJlIHR3byBTb0NzIGFyZQ0K
PiBjb25uZWN0ZWQgdXNpbmcgUENJZSBidXMsIGJvdGggcnVubmluZyBMaW51eC4gT25lIHdpbGwg
YWN0IGFzIFZpcnRpbyBGcm9udGVuZA0KPiBhbmQgYW5vdGhlciBhcyBiYWNrZW5kLiBUaGVuIHdl
IHJhbiBpbnRvIGFsbCBzb3J0IGlzc3VlcyBkdWUgdG8gdGhlIGFib3ZlDQo+IG1lbnRpb25lZCBh
c3N1bXB0aW9uL2V4cGVjdGF0aW9uIGJ5IHRoZSB0cmFuc3BvcnQuDQo+DQoNCkRlZmluaXRlbHkg
Y2hlY2sgRWRnYXIncyB3b3JrIHVzaW5nIHZpcnRpby1tc2cgYXMgaXQgc2VlbXMgdGhhdCBpdCBp
cyBleGFjdGx5IHdoYXQNCnlvdSBhcmUgbG9va2luZyBmb3IuDQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0KPiAtIE1hbmkNCj4NCj4gLS0NCj4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQ0KDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBv
ZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5
IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xv
c2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBv
c2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5r
IHlvdS4NCg==
