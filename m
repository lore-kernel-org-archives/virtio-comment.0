Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F32DC34A
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067745; cv=fail; b=RfccFovfoh/3IiVc1mSYCmZikdKkSHS70RMcBH/WgHnu/Q8zsLeb9MMhAg/Njif/pFBd4LMl/uJTApD+wkOl5ReuCjJFvS0mA50bW42hV0r8cLi1GxM7uYjECezVu6dG6cai9jWF5W9OUiA1mln9S8A6R866J8AnWGK52ZUg14k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067745; c=relaxed/simple;
	bh=MupzqoOJ+oehl5757nH5XtgcHOWcaOt2i7tBx3nJfGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=awLgBAvj47TY8tmI/nJbjXFrBgs+nxZjZ3DQ9TTlW4g7cyFhJ0v+SsblgBjoELQDwq8K6vL/7r9Sj3bJb9/WeB3qCY1OZ+xWHt7DhrwEcCVM/TwSHlFJXGuua/5BaToAa0ettsCgcVxu3CF/SdNxJ4pt8gx7176ylZ6OkY80clM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KUfDmqPB; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KUfDmqPB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbxDtpeW5rjy9mmFjOBOpp8UDFYtAeqrNy50np3EgBvkA+W4efRZeLx52mI7x6SWuCOqiV94xKWNcebjlmZj0R9N1elghKyZaDoGndqczAtI6hv5O2LyS+ow75PPfmO/mmJzFq4U49ru5uG7dyqOEX7093FfLXgpdNIK3J8OEJY0mzm7XlJisCyQGj2euvO3z6uGKo8jCwb9z8GDA7D63XoArXUHSrztXDxdtEQdFHJ1QnRIZvfUo/BW1Ym+iLTBMsHMJytFEouFkW/GYBiTM8YxeakB1hIb1mU9vWwJMNS+o4mBUzliS8x/CHF+BtOQ3rkwSD1VK1VZptL+r86d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MupzqoOJ+oehl5757nH5XtgcHOWcaOt2i7tBx3nJfGs=;
 b=W62ad9dgENcQKumXhaVsvctmu6IRB0mDQvAghLS7vWS3GcTWxqS2FK8mppchMJ5dSRkqDR6a4dnR6RukBOEKUpAVFTGULjUun3TZsGFwT6BgwjnysJ7rm598XFmb7J6oO9QeqMuANYKYQKrT04/WK81HQPm70mVAEFWwNwQ+rOW0dZKIw5CLo/LlCtoGvUF5303GvG0Y5lzUXrENZNHUH022P6bfEya6uGoCxqI0I/Z9OhrGe9tE3mYP52ZSmcLyfDuG1D38ptUjFSKlap6ulrTNTFMjaX+LQJtVw4dLJhTrXD6NXzzgiMhtQdexte6B+okiWV1GN2e1KWlTR2XD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MupzqoOJ+oehl5757nH5XtgcHOWcaOt2i7tBx3nJfGs=;
 b=KUfDmqPB3imDK007yXRFIZPq6ezo3bwXePSq3sDMTDFiP9iAibupSUHa919MCHcQGEaIF3wHISduEg6i+YSRcwnV4sMc7I0Yzj+brcZkLTSxINgfD75f38Zb/c0eH793irM/jfegHRZ+Ma3HojRIM+lRzMxxZXjCwmSkSM2xKLxeVil36y7mRKGRNKxe7n25E9tJVkRMYNYc/RDefYyq4v2k6DktrBwzgnm6OtHPDvqEXIJRXe9JKGP1pZEgBS4keDJqwmgYUxm2ZR3tgKtanYRTpAhcP0TXT9QZRcRuy/4GtnftbfpWIs8aV5Q+Ga/XSMOkFeLhdhoUW7BgxcrIOQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 9 Jul
 2025 13:29:01 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Wed, 9 Jul 2025
 13:29:01 +0000
From: Parav Pandit <parav@nvidia.com>
To: Albert Esteve <aesteve@redhat.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
CC: Alexandre Courbot <gnurou@gmail.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"adelva@google.com" <adelva@google.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"mst@redhat.com" <mst@redhat.com>, "dverkamp@chromium.org"
	<dverkamp@chromium.org>, "gurchetansingh@google.com"
	<gurchetansingh@google.com>, "changyeon@google.com" <changyeon@google.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"agordeev@qti.qualcomm.com" <agordeev@qti.qualcomm.com>,
	"eballetb@redhat.com" <eballetb@redhat.com>, "ribalda@google.com"
	<ribalda@google.com>
Subject: RE: [PATCH v8 1/1] virtio-media: Add virtio media device
 specification
Thread-Topic: [PATCH v8 1/1] virtio-media: Add virtio media device
 specification
Thread-Index:
 AQHbjQWp/o1zNM0Cn0K+LqIiJ2+WobNyry4AgAX/yICAsZ/UsIAAAY8AgAAqNoCAAAKBgIAAEyQQ
Date: Wed, 9 Jul 2025 13:29:01 +0000
Message-ID:
 <CY8PR12MB71956781D048BB39A9CA97FFDC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250304130134.1856056-1-aesteve@redhat.com>
 <20250304130134.1856056-2-aesteve@redhat.com>
 <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com>
 <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
 <87a55dvhfa.fsf@draig.linaro.org>
 <CADSE00LPw5hVzx0=rqwcc4AfJ3Eo4DXLfcy7x4LsVQMgRZocTg@mail.gmail.com>
 <CADSE00+gAfgCz0N8ceS2kdZkvEF6=nBHEghrmm8eXfuyZ10_Mw@mail.gmail.com>
 <CADSE00JOBEqiFjAioJxf-PAB-FfSSy+1Z8WMuU9ktyf=dk-1TA@mail.gmail.com>
In-Reply-To:
 <CADSE00JOBEqiFjAioJxf-PAB-FfSSy+1Z8WMuU9ktyf=dk-1TA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY1PR12MB9626:EE_
x-ms-office365-filtering-correlation-id: 3d575243-9d54-4a5c-ab22-08ddbeec90fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bU5CeWpNQWpqZnBuQmJYdENpOG1IeUpzZllORmh3ZFMya3E2RXhkVlBlYUpx?=
 =?utf-8?B?amVYOUNmY0JMMkgzZkg3RE1MRnROK0svbHM3ay9kMUZhZjU2bnQwWkJqSUZu?=
 =?utf-8?B?dFkzMlZNV09FWW1CeVYxbU5aWmo4ekQrZml5L1dmZzR4SmlhNjY1a2ExNVJU?=
 =?utf-8?B?VXIyTHQ4cDRBMlVOVnVtYUtJb0syc1BYWEpwcmRLTUg4VFI0R3k4dmF0NUJz?=
 =?utf-8?B?NTNyakk5dTJxSHNqZlpKOVFmR1prNVZ1WUNXOWNRUERyWmJvRVhJcjZuZUN0?=
 =?utf-8?B?MVE4c2NNWWFJUTByZmNBeWV6djQwYVBmNFZUdFhFSEs5YUdKcFBNYmFmbjBO?=
 =?utf-8?B?VHVLdXBSOUthRFdJall3bk5jR3E0R0w1M3ZiTkhVQlNiOXJFaTZRRHorVC9Q?=
 =?utf-8?B?OHNEOXI3TTZpMmRFTWIrMzhyWTl2NkNCV2wrQldnZDF0WjV2ci9kdEUvN1I3?=
 =?utf-8?B?dUlKWXlJa3ZMNDhFNit0d3hjRldDRklZMk1vNnpBYXY1SkxlVXJXY0lDblpZ?=
 =?utf-8?B?cTlRKys4Yjk1azdrSnhqR0ZYZVNHT3NsTElscFIwY2F0NE9RNDVzZ2VnNXRR?=
 =?utf-8?B?d2FtZ1Z1NVNKMy9OOTFsVTB0Z0RkSmk3Z0MvQXlEQUVXbmpZS0M0d3dNaFRa?=
 =?utf-8?B?bndobDFwODlXbkhrZEpySFNVTzBlZlhXYm4vcHNMVlQ4aThydnZZMUx4M2hM?=
 =?utf-8?B?OCtJcjBjRjBkMUVWOGpjOUFEQXIyU2tZd2ZtaXZUclk2Sll2bUlBd25FQzBi?=
 =?utf-8?B?RmJMRkVWTTlsZlZRbUQxWTMvaVZTbkoybE1QQmJvc3dldW9ZYkRXeThDWjlt?=
 =?utf-8?B?MzhUeENTbjluUGU0SHhUTWtzMFh0ZkVTMnU3Mi9SY2hXVk50bHEwQUpJdXNZ?=
 =?utf-8?B?MmMwRjVzS0VuSWxZN0gxelBkWnJoTVdHU0lEVllqTmhrSjdsdUpkYlBBQTBB?=
 =?utf-8?B?Ulp6c2drczUwZE1PR3lWeW9OMjhqNGdKYWwwVFBRc0E2NzRMZkFVRXpkL2xH?=
 =?utf-8?B?d3F5UUdUeEhSU0pKR2Qvb2h3YllGUXhiWTdpU216YTdaUmJvOWFCSUZRS1pQ?=
 =?utf-8?B?cmxoeXYydjRPWm1sSFBtNHMyYWxWWlhuV1pibm5uOEp5b3l3ZXpCT1EzUEVy?=
 =?utf-8?B?UFpabFMzak5vTldEUzA0bVdPR1ZnbFl0czlNckVsNXVqckhlaGs0MllIWjQx?=
 =?utf-8?B?QlRBdEJNbndrS0x5VVBhRGFKSGJpOEpYL2p6VTg0blArYldoKzJoMDJEOUZN?=
 =?utf-8?B?VWkweFcyNjh1NGFST3E3RHpzQTA5YWJRdkVHbERWdkNSb2Z4UENvSURkK1Yr?=
 =?utf-8?B?V0RIYWlhSDZFSUF5YVRVRkpzaDd5QUREM25yM3RJNTI3Wnhobm5BOTdhbjZq?=
 =?utf-8?B?T1BvdzRPTWI0cGZrYlRoNFhIT0tBMmdnVHpqdlJLS21laXJXWjl0SzBHSTYz?=
 =?utf-8?B?QkV5aFhndU84R3FKVU9sU0wreXFKb1lrT01UNmE1RDlJMmVLYTFIanFDS0tu?=
 =?utf-8?B?WU41YUhpUUdqMGFoaGZ0b09Jb2h5Nk55TEdPSVlaR0xzaDU5Yk5VcDJRVVdD?=
 =?utf-8?B?Z0luSFJ3V2o3RURWZTlmMDlHSVhoZGw1TUZlZ0kraUNRS0piWjlJK2RlYjNM?=
 =?utf-8?B?aUFhV3dnbHRMSUY0MlVIM1o4cGZjUy9TdThGOS9idUNhWWVJQS9DNEw2aSt6?=
 =?utf-8?B?Q0NlTkExVU1GSnAvRWRWWTRnRDNpbkZNYlVRdWNhNFBOT1llQVB2a2VOQTBZ?=
 =?utf-8?B?Z3ZtUy9Xa1R0WCtRUklCTzcyWncyQkVhMHZQcDZvWk5LMEdiUWZHRDZtQVNw?=
 =?utf-8?B?V3RkMVF4bkpUVEhRWnRHbnY1WC96ZGRlMzF1OFVHQU1yNGtIT2RSNytjYXMw?=
 =?utf-8?B?a3RybXRYNncvRkhmU1QrUCttTVNoSkZvWWdScXFGbkRJRmY4QWx6bDE2dnMz?=
 =?utf-8?B?SW02S3FQMHJqV3hGSXNJNjJJNkRDTzk3NXROVkwzUXJxc004OFN1QUhYT0Rn?=
 =?utf-8?B?bVY2ejVOVElBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGI4MytZNmpOMXBZVm94VnJwbXZRelJPb1U1RkpHRTNXR0NyWGJMejFyZHJv?=
 =?utf-8?B?YUpDVjgzWkRGQjZZU1U0M3BuQUU3WVdiYXpxWFVpbnprVmJZZ0wzZjR2b0Vl?=
 =?utf-8?B?SVNUdWorREhxQnBhd2RkaVg5biswaTRlNm9OL1BxcjNnUGxzRnlGUWVteDhF?=
 =?utf-8?B?dkV3bUlXTDBKVHRpSHZZQVBHS0pKNDdjM0xGMThYQ1FrNzE1UGVYdi83Skpr?=
 =?utf-8?B?a08rQkpGektzcHhTeTdxME9JOU1PYkEwNlRhZ3VPU29OSENtNzZJdHpYSXZk?=
 =?utf-8?B?WDRQa1BBT2lXMTNOU0lTMEZXR200VVZsWHJkRnFGSmI4L0FFczFyZVRSWDRq?=
 =?utf-8?B?cUhOd1N1cHoremJOTmEzMTNmZks4TEZ2UmZRYUp6dUVsZWtCWDJGRjNYZWdS?=
 =?utf-8?B?SE8vT09WUkZXQWU0STlCK2NPYzBncGZQSm43QzBLSGkwWjZoYUVJbCtQeXRP?=
 =?utf-8?B?eUpveHowLyt5ODR5VkthNHpXYTVsWk1KZVE1ODRqaXpTU25FaHVldkpmenp3?=
 =?utf-8?B?bzFsN2tDMFVHeDdEYU43dVp5SkRhM1RjYVlHUWRtYUd6ZGMrUmd5eEVPU2xE?=
 =?utf-8?B?dDdGcjNiK0dFWFpGaTF2WnN1ZXdaZFdtalJTck4yQ0ptQ05ubDNPMEg3cU1P?=
 =?utf-8?B?UXhvUmY5YS9sekpvdXUxZWxWUm9Cbm1Gb3RRMG1MM284VWRJNUlPV2hjZTVS?=
 =?utf-8?B?eEhoUGkxQnB6eFFLbGZ3bTFWMVI1eG5nWFdVNEpJNnlUMzlaWkxrY1RKU25L?=
 =?utf-8?B?S0tSc2RPQzVpbXhwM0tXQUU5Z0pEUlpsNG1XaDFHaEhOTTNWSnQwT2w3d1J4?=
 =?utf-8?B?Rm95eCt2OGw2NnB3cmN2dkxTNGxzc0FPRzE4dzhyc2tIZXhJQkdxcmJtaWVr?=
 =?utf-8?B?QnNvNXZtU0ljSGJKb1IxS3dDU3c2Z2oyWFFWb1hXV0NaTFFHUnA3ZmpkZjk4?=
 =?utf-8?B?NDcyMnlCeU9HWDluSmE1VkZIQk4xcmYvVWFkTTVtWEEvc2xiME1FUkVjQlg0?=
 =?utf-8?B?SXhDNHlSUkxhMStaV09NbEhOQnRRanYwZi9XV1ZFOHU5N1Jhblc5U21BbE9y?=
 =?utf-8?B?bm1FMnRyRTVYWUdMUnRkdnBjLzVRS2dvR21OaEh1bThuMTBKQkEzaUVhZURI?=
 =?utf-8?B?aGk3Q1dpelhhcVlFbHVrQ2dBSUVhcDdSL2VCS0ZUVnBYOWVqYWZLeXZwRzkv?=
 =?utf-8?B?dU9tVmdUcCtDdFpHT1VPaml5MjVtZXlEelRFZ3FORDBmV2VBaG5lUFJrbEta?=
 =?utf-8?B?eklJREhJMDVxbVFOZ3NROEhkVzhJcGUxWGQxbzJWWDFUUVQ0dlV6Ym9PZmlN?=
 =?utf-8?B?YkhCMVBVRzZMZ3F0VmF6Nk84TndhUS9XVG9qL1g4alFKUHgxZnNjNGo5WlRr?=
 =?utf-8?B?UTcwc2FrOXBxY2I3NVhZWWFaZkViQUc3OW5XaDlCY3ZRSnpJK1pRV1RrRzJ0?=
 =?utf-8?B?QlNBM25ZaW5zeUg3bDRqZVZDYnduV09GZElHWTUyUnc5YnpXS2FBR1pub3FJ?=
 =?utf-8?B?aFRHbFZBM3hxQTFYazRZb0NmNFpVOUtXVG5DTW9nblhTVGswQ2ZQd1MxUGpr?=
 =?utf-8?B?VWV2cHRZWm9JWCsvZHhOSGt4dGlueHEzTUFYR0x3UEs3SGlhK0V0MlJVMHph?=
 =?utf-8?B?WC9aVno4KytSMnFYY0hPYzNwMnFJZUExaDUwQTBXTkdrUTlwWHNPM3Q0Wlk4?=
 =?utf-8?B?Z0xnaUVBWE56b3BtY1VJM1BhTzMrV01WbjdTNmZLRm9CbTdLdUx4aEVKY1Jx?=
 =?utf-8?B?SWFpMm1WUWxiVWNTQ1hUUC9hYUNxTERLb29lVGZpaWZJY292WVJXa2x5aWEw?=
 =?utf-8?B?djZqd1pyOVl3WVlrbVV3dFo3TkY3cngzNmlpZjlraUpKR2hud21Jd29LTTRS?=
 =?utf-8?B?VXl4SVBmaUp0SG82OStZbmJ1OHM3ekx5cjk0bXkxUnZKMlVuTVg2ZHROY1g4?=
 =?utf-8?B?SmN1Rjl1RE8wR0J3MHNUSUc4MTYrVlVLWFdUeVhJcTF3d2J3cFppQThFbjVE?=
 =?utf-8?B?RTVrUm5OeVVDaGY2TFFJdkZ2SW11WTRkaEFmRWRJUit5bkNJRUliRWVHUUl1?=
 =?utf-8?B?aXE0UnNsckNjbkJVSkVLTFZoQlY2T3FuNTlxdGkzRXpFdzJVYzBwZ21nR24x?=
 =?utf-8?B?WkIxU1dHZjNPT05lSHQ1ZmNUZmhWby85cFRDWjUrYnoyQ2UvK254UWFzSEZG?=
 =?utf-8?Q?zlLayIgkQrRlyyYVx7uT+ra6NjNJOEARtKk8z8wI4a3q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d575243-9d54-4a5c-ab22-08ddbeec90fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 13:29:01.0495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Kr0bluPQ38aWRpn4wkE4Ddo+xDTTbnPxcsQeJ9YX1FuCRHZVnu/67P2gshmmgchPf12deZs4MMaZ9xI+gWKCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626

DQo+IEZyb206IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT4NCj4gU2VudDogMDkg
SnVseSAyMDI1IDA1OjQ4IFBNDQo+IA0KSXQgd2FzIHNpbXBsZSBlZGl0b3JpYWwgY29uZmxpY3Qg
ZHVlIHRvIHJlYmFzZS4NCkkgbWVyZ2VkIHRoZSBjaGFuZ2UuDQpQbGVhc2UgY2hlY2sgdGhlIDEu
NCBicmFuY2ggaWYgZXZlcnl0aGluZyBpcyByaWdodC4NCg==
