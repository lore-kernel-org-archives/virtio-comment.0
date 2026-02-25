Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF153B8BD1
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024825; cv=fail; b=JJMJpKVrZiAhGzc9gRRgfULDxIMpRSu1RapTYbyHEmXb3Svvwodhz3MyHZgKcdQ2U/2sQ68XJ9PebsQAEZ6tYcK0ISx5cJipQgURxCKnZsp8Z0CKF/kpndBrmGUfr1kIXZhiYTUC1lB3MhCmN2T9JUbmaBbd1KC/VwYp+We7TrY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024825; c=relaxed/simple;
	bh=jnxl43+XIADwS9Zhqbl8SkE4uOtbxOulu3+ClZjst2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DmbniPjpuPPDv2aMVdHDCJb6KUztZJda39DIki79A7KUWxgm1gfjDMUsFX5uo4q9J3lI0GOfeNgutUsDmfhHepdfsClJjlvKofd2JxavZAScC3+tZV9EPkdhSf0bpvQdWlFCSSFeUKrkO24fSpnMeU9xNzF3wxgbQGfRwSKrqoE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lxShtbBe; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lxShtbBe; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lxShtbBe";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lxShtbBe"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oAcSvV61t9k16/oq0X0tVGPXaAW8J6Fa2o489QwoVKRhD8mOAJs4gps3CcPtOZpHgwwNaAzT3rzr/ZPw2M2eM72nFWiUV10Kfxe0Ltn1G8BeVczMbihgIkM11cVbdy516H7B3nOfuCKAAsOGA7yZHlgeEhYtzjm5gMVrm59pTtGptV6OI37Ss8t1S9MqovngYDq2S4pvrXT9wq5lXRwLAz2hABA/5cqgw6/Hm2eM3k4qDieNpVKf+bIsC0N/9HnJZnXrysJXBQK96utGg79AbOi8JZaXz5vyijq5KX2aWFQ8iKwLTHM/LA/1q9Ku0jHw3SQdhEkSI+5nRs2iGrAMbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bLTT7+HV/106OdKcns7qR0UBmWKmtmUcG6awmT3rVY=;
 b=lSGUu1sIaRFfFMY7QNAtuSI0Vq5KTzXbIHTKTjrVpoGnyixyRpnSjp4Rm+xyfVibDS+tobqpn1YLN5xqts9WqMhzqm44Fm0aTZEudF+Y6UCpHLrblfjvNK3GdGgJv7haFdxHzqJSC8hLZH6jwEKsuUS6BA46ZBm2axdJl9bRKGtRXqomctDe8ESQ4hRCqUFGLacN/mmTCiMi1BMfu225UihIPr019xpWCP6+u4qUVAnpWb57+kY07oAzuSb/6fJqt8NtHyx++XXXWex/DsR7jDayJA7nKzeaMJP06+8Mlv3XutYctdUKS6Re0pCcPcDE09kVLOHv3qfCQ4vjCx8ZBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bLTT7+HV/106OdKcns7qR0UBmWKmtmUcG6awmT3rVY=;
 b=lxShtbBekhkfIWLw2e7q/m7woqLCsDGLooNcQiH8dHQ+5Q0fWoXLdaFmd7kS09N9SvurEro0+KnC0/whw/TZAmK/UsqIJu21ruLYO6VCocsJ2c/qwVBLR86zzrrO8pIdTOhYei1XzHVhLW8gDwscJFi0bEZMETQmfjTob24Tw7o=
Received: from AM8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::23)
 by DB4PR08MB9862.eurprd08.prod.outlook.com (2603:10a6:10:3f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:06:55 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::f5) by AM8P191CA0018.outlook.office365.com
 (2603:10a6:20b:21a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 13:06:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 13:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9t+j0PFt9/UwGtT4bpv3C7gwySQq0MfBJ+ZAXLbp8P1eLBLPEZaVjRRFZMYUzh+iPlW5Za+h4t8j1c9JWZvl1CskFGp9tvR7mO4/D3ejpsdhQUzCOBQeHVkK2Dse8LmddIeXZkLJ7pcGT42IjajFdy02WPRgigjM4d1KtcvOxmqmbHkHWhrUbznLkWgWlTMnSxwGNPnPtaSNztZ0Do13NTf0zIp24nlvVwkeKjN7g0mS/HKnqFK3lXgDiOmpgW4gTB73Cu4CgjLMsTcNXet10qwtuT0q+bnKIjeSlqkTN1g0Eq9VU1sU2EWssol+S+FAdLjmgCTBUuUP5A6CMHPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bLTT7+HV/106OdKcns7qR0UBmWKmtmUcG6awmT3rVY=;
 b=xEjlX6MOS7/azV2QwLSq4SMi5DP8SmN7yRbMXAyYWoCSoSU4PVRdXqoatG3Qp4vL3kdKgO7jlmhUdjv7zzxwqBsQXKXpDyXfw2UpqPY0a+1mCmkcvNWnVSBkJ2E71UG3aCgRAwdG4HIFWHyFTtDD++lawmYiYFiQkbgGOuMe8sMLKxdZFczsLSq3+Q7eF0HrnEUMMVj2p2j9gwVVf5vmRJe4RSP6MVGqL83Ge+cumQzF+IccpvIssS08gY312r7wZL4U0/gIXO7ceEZ4kX1r6k5hNd/ONdUyhZgA2wfAgaSmjqQABrx1GOCiVyUholFZ5YA1+kybnOROK9YL/hTkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bLTT7+HV/106OdKcns7qR0UBmWKmtmUcG6awmT3rVY=;
 b=lxShtbBekhkfIWLw2e7q/m7woqLCsDGLooNcQiH8dHQ+5Q0fWoXLdaFmd7kS09N9SvurEro0+KnC0/whw/TZAmK/UsqIJu21ruLYO6VCocsJ2c/qwVBLR86zzrrO8pIdTOhYei1XzHVhLW8gDwscJFi0bEZMETQmfjTob24Tw7o=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9252.eurprd08.prod.outlook.com (2603:10a6:10:41b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 13:05:52 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:05:51 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Parav Pandit <parav@nvidia.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAqpM4CAB53BAIAAMF+AgABSN4CAAAV4gA==
Date: Wed, 25 Feb 2026 13:05:51 +0000
Message-ID: <1A56B3FE-E529-4FA8-93A8-5DBAD81A72FE@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <62E0DF94-3401-42E4-9574-02C557849D44@arm.com>
 <340e37ad-6eb6-45c2-87a5-422f247229c1@gmail.com>
In-Reply-To: <340e37ad-6eb6-45c2-87a5-422f247229c1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9252:EE_|AMS1EPF00000092:EE_|DB4PR08MB9862:EE_
X-MS-Office365-Filtering-Correlation-Id: 3661402a-4af3-4b58-4d12-08de746ec01f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 DICnOFYnpoUUWSfx/F++0Kr1iq7NwqxOhjztv6AbgdOC8U+1NtmLW0LXbbyYaimp+M5YL/D8AD9B0k/15EDqcvXj3+OdsCaH6ZM4rz/T90foe/yit7ZJvuvMVNdl4NlPWETszg+MnLWg0sBPE1Tv+5E39ci4jiP/gS4jCMRiD/N77z01iO2uhOkgTn82FO9ZTt/ZxENKlCcRfO0IB/uln5dSYh8+VKS9l+V1aaDy7zYrDIlkEpkP5pPndPWlZzmkX3podKOe63/HUiil7dfeBUkhwGm281cKM8WfHF8Ib8JeyLp3TsYcHQ60SCatiZ9nUXufzKeSOUly4l4KklT5Cp0JZ3nt3vrJCRpsAI5ERooT/8SBVijH7Ng7hfTYVYMXxEDcXYhZRe9Oj0N2yaJQx9ioUgdNTKDrkIvrN6JOexiqRLj0wi665B8RC4avJ2eHXUZuPsKVed0Gr50RvOF8Q7ddr+G6MZ1B2zbKQIMa/xT5IQlxrZmtJtDSBEyF/MEe++r363aRkU6FFdRRoDlIiyuQOo81jAj9PH1ehkNJP4O11YKbQDyc0GsjnQNqkRwzXLQVTNOr7zxueYTmKfDm1qXeczweKzSTC7pU82rm5HQZh0vD0dSrBSBMeUyqomz1LeIfQaFEoG+SiCaqTNmE2u5KT01lD7jD4BaiXmBTx4V3kZjtNUwwfcCAsQBIZCtg4+OxW8VRxWNwosKu7OZAjGJxyVimGlLPCtSoBlHxb2LwCI263qA0SEFRbKMD9QTnZgSJBFo1sO742AK0MKW+tXeAArcw0hc2J/0Yy20YtYQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBFFAA0AF483674B8CCEC7D45A64C679@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9252
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fa91c83-c991-47af-a0b8-08de746e9a64
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|36860700013|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	+fr/d1lrgdDo7aG7Na5zbkcVe6pssMJokUZ4ec+PzdeNZozkrcNJtcz6WYXJfQPuC4S/KO4Th6l4OZQg71lE6lgCoHkejzBeuIdksklH3c4/3EOhvtERzHg6yoVRulM+iVQN9Mn2iE6WluAOyrNl427REB3F4b0e6S9kOXe/HBxgocqR83uvABnbGfUtp7nzTGoeC34Km7BOuJyaNMJEMRB2Pn23W1X+KuFQuRdEd13FW66Qy/C2+eRSgPnvs6hvJ3r0kJsKXeN/0UWpYfPnsGU5GEp3sNt2lKZJkX0t2G8USYQYLPRCZMwPJdSUC18UXGcFSZKLkYZFaEVn4DXh7ZfNE2yAHFjDZ0Qe08sP/FrRg7lnninlktXrS9gWC/FFnPKjMBqA2MxCVGYOvB94W1CTfnFWPV3zNQCwUQo0b9YSYj8ykmxB6o3FdhiQ+sA6xHfWGDlMV7n0usBXWOttzngdwQyOEq6q6jnD+etTn2pxGDUjWkqLbyqH1iahFfKk/83WmFr5V6cLMtnd0puRCwjQCHBrMhGHf06YEzoeiwsy2cqz6vy1I3mdPqUeuEnyPXNSFwMutNW9eUwa7cTGAKLqsnJOYyfu1baUG1m+bSfWP/N4UPhNNehfk2GlcKkqK8kRzM+t+bE7MwIt9ce9lpdm4i3nCTEbhk0dlo4qONfjgCKB+Cj270VOb3hTyVc1OwscAWwzEDFcIdjfxdaawCDFuCGPUN3V1KFrGRhqfqRH5HqCAEzIwpVYi0IAsgwR5tfyHtkc6MDNd53Ma58JAzCpCQmorw9PJ56GehlcsRG8+WXaYQgW72jbncAcwixkdLgy2iOlibjl2ftG4F6/0g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+FEFCB1Z30Y3wP63L8+hU9M56jlJ8KvbZGs6ik8hIJceNGubnJR/gk3a1yiW7xuQ8bGGVmcB0fqvEBR4WvuTMXwa97OciQXoZG/CF/2yDhqTgPKM/owQde8UMJ1JL+0+90E0DdHyfjqZNfhCAen0h/RM7OHiMTcRmLoy3PZsnMSfaybk1H5zLJ9xZqVp/SWajNU3XSDb0ZedejfLmFL0Te2o4Pd4IRxJjjbXttikkcQdzKOJHMe++9mBcc3Y2CVP1EtQLUh0TTIDGHJLdpE8obgSUIepsVOuhq0fpGRucSO1XS3xrNq5g/ZUqDgmRD8KkmUSPWiJEd6aTTMH+7taiDiLOkC0JJw63EJvWjRBEn+VOTeVBqa6BH5wTHFJegkHl0U/TUoYqRzttHK5cNfaHPGUg2zOk5yca/guEvsQNd4nwRBB7pm5Dsixv5rSG6W7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:06:55.0696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3661402a-4af3-4b58-4d12-08de746ec01f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9862

Hi Demi,

> On 25 Feb 2026, at 13:46, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/25/26 02:52, Bertrand Marquis wrote:
>> Hi Parav,
>>
>>> On 25 Feb 2026, at 05:58, Parav Pandit <parav@nvidia.com> wrote:
>>>
>>>
>>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>> Sent: 20 February 2026 02:10 PM
>>>>
>>>> Hi Parav,
>>>>
>>>>> On 13 Feb 2026, at 14:52, Parav Pandit <parav@nvidia.com> wrote:
>>>>>
>>>>> Hi Bill,
>>>>>
>>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>>> Sent: 26 January 2026 10:02 PM
>>>>>>
>>>>>> This series adds the virtio-msg transport layer.
>>>>>>
>>>>>> The individuals and organizations involved in this effort have had d=
ifficulty in
>>>>>> using the existing virtio-transports in various situations and desir=
e to add one
>>>>>> more transport that performs its transport layer operations by sendi=
ng and
>>>>>> receiving messages.
>>>>>>
>>>>>> Implementations of virtio-msg will normally be done in multiple laye=
rs:
>>>>>> * common / device level
>>>>>> * bus level
>>>>>>
>>>>>> The common / device level defines the messages exchanged between the=
 driver
>>>>>> and a device. This common part should lead to a common driver holdin=
g most
>>>>>> of the virtio specifics and can be shared by all virtio-msg bus impl=
ementations.
>>>>>> The kernel implementation in [3] shows this separation. As with othe=
r transport
>>>>>> layers, virtio-msg should not require modifications to existing virt=
io device
>>>>>> implementations (virtio-net, virtio-blk etc). The common / device le=
vel is the
>>>>>> main focus of this version of the patch series.
>>>>>>
>>>>>> The virtio-msg bus level implements the normal things a bus defines
>>>>>> (enumeration, dma operations, etc) but also implements the message s=
end and
>>>>>> receive operations. A number of bus implementations are envisioned,
>>>>>> some of which will be reusable and general purpose. Other bus implem=
entations
>>>>>> might be unique to a given situation, for example only used by a PCI=
e card
>>>>>> and its driver.
>>>>>>
>>>>>> The standard bus messages are an effort to avoid different bus imple=
mentations
>>>>>> doing the same thing in different ways for no good reason. However t=
he
>>>>>> different environments will require different things. Instead of try=
ing to
>>>>>> anticipate all needs and provide something very abstract, we think
>>>>>> implementation specific messages will be needed at the bus level. Ov=
er time,
>>>>>> if we see similar messages across multiple bus implementations, we w=
ill move to
>>>>>> standardize a bus level message for that.
>>>>>>
>>>>>
>>>>> I would review more, had first round of sparse review.
>>>>> Please find few comments/questions below.
>>>>>
>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>>> From SIOV_R2 experiences, we learnt that some uses have use case for =
more than 64k devices.
>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain fie=
ld.
>>>>
>>>> That is a very interesting feedback, we will definitely take this into=
 account.
>>>> We will have to decide how big and I will answer that in Demi's mail a=
s there might be some drawbacks with
>>>> having very big sizes for the device ID.
>>>>
>>> I am slowly catching up on the thread.
>>> There are two types of device id needed.
>>> One is UUID style to uniquely identify the device that may show up usin=
g two transports to the driver.
>>> With that a driver can create single virtio_device object, which is rea=
chable via two different transports.
>>> This offers performance, resiliency.
>>> This is likely a bigger string which is not efficient to use during eve=
ry message transaction.
>>>
>>> Second one is: within a transport, a device id to identify the communic=
ation.
>>> I was referring to this device id to be u32, so that transport can supp=
ort more than 64K devices.
>>
>> We will increase the device number size to support more than 64k devices=
.
>> For the UUID part, I feel it should be something provided as device info=
rmation per device, so
>> we could add a non-mandatory field (nil-UUID when no ID available) and t=
ransfer that information
>> as part of GET_DEVICE_INFO.
>
> When would it not be available?

I am not aware of implementations assigned UUIDs per device.
In any case the field can always be there and the nil-UUID used if somethin=
g does not have one.

>
>>>>> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual addre=
sses.
>>>>
>>>> Set vqueue has an index to specify the virtqueue index but you have to=
 specific all fields in one go that is true.
>>>> Do you need a solution where you could set some fields to a specific v=
alue to say "keep current" and only update part of the vqueue
>>>> configuration ?
>>>>
>>> I believe so, otherwise it cannot work with existing drivers without dr=
iver side caching them.
>>
>> I will investigate that possibility.
>
> With the current spec, adding virtqueues one at a time requires time
> quadratic in the number of virtqueues.  That's not good.

Solution i am looking at would still allow to transmit everything in one go=
 but would leave it open
to only update/modify some specific fields (using an optional field mask to=
 not modify some parts).

>
>>>>> This requires caching all the values on the driver side before sendin=
g the transport request.
>>>>> I think it is time for virtio spec to shift to virt queue create and =
destroy model using the admin queue interface.
>>>>> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transpo=
rt bindings.
>>>>> It may require more plumbing, but it is cleaner interface when a new =
transport binding is created.
>>>>
>>>> Admin queue useable with the message transport but I would be interest=
ed to understand exactly
>>>> the model you are referring to with create/destroy model.
>>>> Could you elaborate a bit so that i could understand what messages you=
 would expect and how this would work ?
>>>>
>>> The suggestion is to not use SET_VQUEUE legacy.
>>> The suggestion is to use admin virtqueue to create queues and destroy q=
ueues, as they are merely an object.
>>> And new transport like your proposal can adapt to the modern style.
>>> So only admin queue configuration would be the only message.
>>> Rest of the other queues can be created directly using the admin queue.
>>
>> In a way, set vqueue message could be seen like that as it is a one time=
 operation.
>> In most cases, drivers are configuring a virtqueue in one go which is op=
timized here
>> as we need only one message transfer.
>> If we include the proposal to also have an enable/disable directly in th=
e message this
>> could allow for even less messages.
>>
>> Using the admin solution on top of virtio message is something possible =
and not prevented
>> by this solution.
>>
>> In my mind we have an object here as you create/destroy queues in one go=
 and the fact
>> that a bus can transfer those requests asynchronously gives a solution e=
quivalent to what
>> would be provided by admin vqueues.
>
> Why disadvantages does using admin vqueues have?

You need a virtqueue to use admin virtqueues so we need to have a solution =
to set this up.
Once there i agree you can use that instead but it would not change the fac=
t that we need
a solution to setup a virtqueue.
Right now nothing is forbidding to use them, but we still need to have a wa=
y to configure vqueues
in the transport.

>
>>> One can say it is orthogonal feature and I agree with that reasoning.
>>> The part that bothers me is that the new transport ends up adding some =
legacy bits like set vqueue.
>>
>> We still need to support legacy to have existing implementation working =
and here we can optimize
>> them a bit by not transferring one message per field.
>
> Which existing implementations are you referring to?  It appears
> that these are mostly in embedded systems.  If they are shipped as
> a single unit, the drivers and devices could be updated at the same
> time and there is no need for backwards compatibility.

I am a bit lost here, do you mean we should or not have a solution to updat=
e individual fields ?
In any case the change i suggest would not remove the solution (preferred) =
to do everything
in one go (plus the possibiity to enable/disable the queue in the same mess=
age) but would
also allow ot update independent fields if wanted.

Cheers
Bertrand

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
