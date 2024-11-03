Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C9139D1E
	for <virtio-comment@lists.linux.dev>; Sun,  3 Nov 2024 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730610570; cv=fail; b=kfiH54EMYhQKahtvIgiSCpWu6CBTuJRM3jr4mLscHUTiAGAAcCSWSLyL5N3K6Rx8OSArbyg6s1XP5Ur7nChhVB6u3/VriHQ7AT0bkihvt6UAkLhlr0hqyJAQV33TRCzVOqe8lEi1cesqw6zdL4lc/H38dW7GXS+GvZ5KBu6+Dcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730610570; c=relaxed/simple;
	bh=5bSa2RThcgIM81yzyKKzoDQrrnaGNyUN/vBdwHT0YBU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D1+8RcVTlmBzAWWAd2hd2vwvrKFFRa1ZgBYk9FGsZ464Vn4CKsfni1YJh3OowZXezqsE2M46t8oB1Z7GJ1SJJP3adhe58PDDRPfZRwrwy/BsCZq8FJ+T8N76JT+qY1QuWqv82H/MLurmRjl2i/nqHF5s9yY3XNG+dNIjoXyBE+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nKzNjViO; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nKzNjViO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXZp9l3xMrZz382odefuw/Hb3URsD7Ko7OQs4SvQIjLKjTvVGGy2dje5juTFaSWV6v7mdH1nkRBEXn2p7szGRheUDXvzzMVUVkVzxgYdHTQJsUo6JDxYayrSZdYrZnH01Y8Pe1FZ85sQCnibHFLaQsXV0TNDHM3xHQRATMpXXPYTCAWdS0Dfth1OEG062CAbSExhZc8QNouBFnN6W3Dz2jkBqqAXzesT+TC4AN6MAPZEO2r9Pwa0B9IRlrEa0xrcaJQqEUUSX37l8q7PQUHF0b3fH1UnkqNdjLecTsA/S/XKSOHdsMW7ovI/9qGzoguMGp0FA5Eg38PWRSyT0F/C8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bSa2RThcgIM81yzyKKzoDQrrnaGNyUN/vBdwHT0YBU=;
 b=Mq1obu/us9yESQnHODPLKSNqzDikoqMK4i/PWDZfvweIn3jl9pS4OQKoE55ZIb7KD3OtICnqPDt6gPs71AhGmJ164SDecWjzL4F13AslaMFVCjKsMpNb5BRw0e3bTdbn1ovM+CpnSHRtind6HgaUtejR/lqf0zYdTuTa15QxYObIZDmiVxyDTZ3YJs/IKLoY1srwBJGXgzL1hvc2p6qYilkNm01+SIY3ig3BL4L3JB7yUWShn8zKQ8eTtKhWWYXOTzaiFGu92NJrY3fJ638fi59RU5i0TaB5KbgX/oCNj7UpzlLpWcR3PumgLG4RXKP46YHawKQPsCoCeYv67KG7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bSa2RThcgIM81yzyKKzoDQrrnaGNyUN/vBdwHT0YBU=;
 b=nKzNjViOakJnEvTce3EibcOh4+mwMv+1c6Mob0DSCLjD+9BZOc1cmIXQPKV37zyOkc6VBltuo3b4ubUiixuYbOUPfV/UjcKd8OkJ5o+EbOll7TwcgOp8w5aPTX3TuN/Br0xxClgwg0dS+7IhKjNc86lKaY8k88RDOo19LXaCZUDabdgvpU1sw+2k/0zwD6WZ8IB3TRr3/BYfjpceL/IOK/ZDRtPbiFNjCMuyvvXEIW0PL1TPwIN3aMCq4lSMbSwDFrviyiPWEmaHUko1z5wowgnFDdLqAeHqAip2MLEZ6ool0lRgoLa5B/H3qJ9f66QKmZhqpqDsMy3SJYBURapEIw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Sun, 3 Nov
 2024 05:09:25 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8093.027; Sun, 3 Nov 2024
 05:09:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "Aiswarya Cyriac (QUIC)"
	<quic_acyriac@quicinc.com>, "Alexander Gordeev (QUIC)"
	<quic_agordeev@quicinc.com>, Albert Esteve <aesteve@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index:
 AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUIAAKTQAgAAMvECADF83gIAg93dQgAAoi4CAAT8BgIAErkXA
Date: Sun, 3 Nov 2024 05:09:25 +0000
Message-ID:
 <CY8PR12MB7195682425E8A6733C756A46DC502@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
 <MN2PR02MB70075F9F639AFB00B9142A3690542@MN2PR02MB7007.namprd02.prod.outlook.com>
 <CY8PR12MB71950F2D819130F83939E8C8DC552@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71950F2D819130F83939E8C8DC552@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB6491:EE_
x-ms-office365-filtering-correlation-id: 5e4d75b1-5aea-4014-aa2a-08dcfbc5af95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXQ3Q1huSmxjSHppd05keDlOWlRlNW1HL3dsZlFxZFhKcEN4RkRUSU5hbWI3?=
 =?utf-8?B?MDBYL0Jrelh4UHVlVmtjckFzWVo3V0J5WVozRmY5d0ZtU095MW1xdElrdEFu?=
 =?utf-8?B?RCt0N1g5RXZVTXROTGl2alc1N3I3V2IxM01HeFh6ZHRVY0dpdXBrc21Ib3Zq?=
 =?utf-8?B?eWRwbnI1aGJocjNUbnZ3bW5MTU5ya2U4WVVEbm9PWjlWZlpYWHFsVnhHK3Zx?=
 =?utf-8?B?TUs2VVpRRUZhVjc4T1ZtOFJhQUo4M1MzSldMendRVHNqSVdPeC95WkF2Q2R1?=
 =?utf-8?B?aTd4enk1ejBRK2gzKy9paWFjMzQ4SHppMDk4Mm1ydmF4ckZORmc5UDI3Umxj?=
 =?utf-8?B?ZzVwZHFPbmJRV1NncVZhMEh3MTJQek1rWnZPNHNSbWtYSGZGdXVxYzJyR0l5?=
 =?utf-8?B?RE1ibHBiZXFXcXNML0Uyb3hlWlNtQlpXUEw2RmZLb2RMRDRzenZxZnhxYTdi?=
 =?utf-8?B?N3ByanBrTElGUjBDL2l4S3dsWmxYMnFZV1I3V0oxamw3ZWRLa0htdEJrdGQ1?=
 =?utf-8?B?Ym9TSCtsYm1wOW14MkVQV2RxWkE2RzdyRHVJamV3bENDRGdHWUpJaFkxRXRr?=
 =?utf-8?B?L0o1Z1E4aDYvNmNzK3dGL21CNFFCS1BRSWkyQ2U5Y2J2eUhNNzE0L0x1Tysx?=
 =?utf-8?B?MmJ2TXhDMUMvRG1kVVNoNmhtbFhmWFZZejIvQzVCSE9wek10ZU4xWktiZTdT?=
 =?utf-8?B?dXNEZzB4RVh6RUNiY3FjN0FGZnRsZlVFMi9zaGF0dlBocjYvU3R0NEl0bFRi?=
 =?utf-8?B?eDJ3MWFQczFFeGJzSnAxckxjcURTeG9oZjVkVTN3d0g4dWZ3azFja3k3V0pX?=
 =?utf-8?B?WTJyVTFlK0NBNFBBQy8rTHJJbEJXTVJOc2JlYzM5bEdYdWpBYkQ3WHNsTTB5?=
 =?utf-8?B?eERGVFdGOC94ZGRGUHRZK0s5KzFFOWdOYlFrOFlnQkxYNWF0UEFLQXYzQjBN?=
 =?utf-8?B?dXVJYnpSald3OHVDR2F3aVJXYVNEdlB1TjhGTUpyZHAyc1hIamllaVU5bk9D?=
 =?utf-8?B?d0VacVNyVnZLWFVBUmgzRXpvY3FYaDNtVFI4RzBBUFpZd21ZOEZsTjkvYkpx?=
 =?utf-8?B?QitVYk83aHBJejQ1bXltV3lxSWxEaVQ3d0ZNZW5ENzFmL1NmUHlKM3lRVXJ1?=
 =?utf-8?B?N2RCV0hyUnBiSTd3OFlHT0VCL2dVNEd2ajhkbFhQcjBKKzVXRjlyckFhREp2?=
 =?utf-8?B?ZG9uWkEvNENHZ3EvblF2L0JUVkp2UmUxOWQraVcwL1JqSFBJQzdGMjdscWI2?=
 =?utf-8?B?Um1NZFBqRGxkdE1VOXUwTk5XcVc2bVNhLzhlbEY1M3o1YkY5S2ZNZFdKd3hB?=
 =?utf-8?B?aEpzVTBHUW1wU3pRdVBzYWtzZUw4WVZNd1J3U1pGZ0U1MkorbnBDWHNmNDZm?=
 =?utf-8?B?OUs2S3phb1A0cFNLRGhueXlDMnhXaUhwb0YrZE1OWXArK2k1OEtWOUhBSkt4?=
 =?utf-8?B?SzdFM2NnWVluSkVEcG92ZWVEZ0Z0aE0weWVxMURPc1RWa2ZUaGVqZmt1a0Z6?=
 =?utf-8?B?Yk5JM2ZBSDlucDFzMlc2Qm1GK1J4b1Fvbm80QzB4cFluQXVEcDJ0Rk1MbTl0?=
 =?utf-8?B?RmVaa0h1SERGV1hRdWtHQWZMbXhCRVRKdm5HSDJHQ2FFdXhNVEpCZm5yRkVT?=
 =?utf-8?B?M2NEL2tHVFZzbWtrQnZJeTVEWDMrQnR5QkhSbWNYaFlDSUZPRFJOaE1UdXBs?=
 =?utf-8?B?ZHhKTG5NaEw3MnBFMWtQUUtYTkVRNVc2R21aeEkxZW0zNzgvSU5WVVRTYmo3?=
 =?utf-8?B?cGZzQnJGbm1jb05UTENpa3VQMStzVlVENUJJb1ZkRDdHcnE1OW9VMGlIcmEw?=
 =?utf-8?Q?YqDkIyOwfhc2fN4lmfNNseYJiQhMzzABk46aI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmN4R2p6OGhmZE1ad1prLzcyMWlBMFh6OXB1ODA2ZktEdkpqRXcxUUxYN2Y0?=
 =?utf-8?B?cTVCSi9kSzFweGt2T0FXd0F5Sys1SXlUQUQ0WmpqcGZsaW5vckQrWDdvQnFx?=
 =?utf-8?B?UVAzS1U5ZE5YNUpjYlVUVXgzZjkyOG9jeWlpZmFoUEtWVXltdm13eG0wUGdP?=
 =?utf-8?B?dVVTMTNHbUlTY2pZL1UrdWJXTFFqNE5IQ2VPQWRXYUIyVEJrMzdEWWdNR0tH?=
 =?utf-8?B?VkUvck5CVTd4SmpFVi9EZ3Faai9qdnpiNG5hNitLRVhtR3NwUGJNUlh4MHpZ?=
 =?utf-8?B?djVqYlQzUkZORlZ2dVV0NW8xNWhPN2Z5MHc0QU9xSm1PQTAreEp1dWdCeW9s?=
 =?utf-8?B?aUV1ZGZ2T1huWHdlVUtydmtwdTgxS0lxQWR1V3lsVHVRWWlQSmdrRlBhaU9L?=
 =?utf-8?B?R01kSUkrQ1VYR3MxM0twNDBMNFAvd0pWcW03UTU3aVBQOGNKY1o3bzRBY3ZG?=
 =?utf-8?B?VnQzTkpFMmJVSUVGUVp4ODhiTVF5NzJXN2NVVXMxOEtsWE5DWk5lVjlrZkJt?=
 =?utf-8?B?dUFIUEdjOXVMeFN4WFNFSklwQVM5MEwxdnNiRGlTajRXblhtWGczV2xqOTBU?=
 =?utf-8?B?Z3duWEZrZi8xa1hlL1huL1hwMmtWeW9FMGtvVGZPK1lzbi83OFVZK1ZtQUFI?=
 =?utf-8?B?OG50V3pGQWNvME5sZGVNbkxNNGtrWmdua1BENGlkUmxJQmpjYXUzajVBMjRV?=
 =?utf-8?B?TWlVOURxQkxlZU5yVGcvaUtRNEZBNUQ3aUNlQTEvMVZzeFFCbGFGNTNvNUdR?=
 =?utf-8?B?WXRhejZ6bDJBd2gvaXlOSUJGd05aRE50RC91UXJGeEI3dGVKT0dvZVNZSEJ2?=
 =?utf-8?B?M01TOGMvTWNhL0RCd1U0bGpna1A1S2VPbUJzb29NYldKK09QdGgrT051NlV6?=
 =?utf-8?B?UnNacm90dDN0WGFUZWVwK2lJZUYzYVlBUjhWbGVWc3AzNUl3QVU3U0kxbmJL?=
 =?utf-8?B?UVpwNFlEeE9KZ3B0WkJnNlJ2NC94QWdpL2Y5dlkvK0xHZ2h2UnN3OWJhK0FG?=
 =?utf-8?B?OFF2My9Wb0tOQ1VRZ29YYTNYRTE4aGYwK3lidnF1SG5uMHJWYXhZc3AzclVI?=
 =?utf-8?B?UG5mdWFtYnVRbGQ5b3lHY2w3eldmWUxUV2dZWkZHeHdmNmxaZmU0Mjl2akU5?=
 =?utf-8?B?d1dTdWxHVy9UUitmcmVZV1Iwc20rOHV6S1ZackNTQkVWak1rblU5WVZHbHJM?=
 =?utf-8?B?Z29XWjFDbUF4UlFqQW9OUklMK056OWRMd0xZbGtCTEwzWmpyeHp2THlxcWMy?=
 =?utf-8?B?NUtIRGo4a0V3bVd3N1RNQkptQWs5eHNaNGdEb0VKWXZpSG1vMldGTEFFL2d0?=
 =?utf-8?B?aHhQSFhPb3djRU9yNmt2Snd1QTQ3TUNobDJUK3dhSmZBbE43dzY1YmV2aHRz?=
 =?utf-8?B?bVpsUGR2Z3I3RHdzMGFta1pCK3RrOElMMzVIV0N1Z2ZuOGFhWVdMUHFJQ2FU?=
 =?utf-8?B?enVOcjg0SlNMM0pOU3dZT0IvNHFveUt4aTlaOFRBZS9ZVTMzeGxJQWs5WTd1?=
 =?utf-8?B?UHRPZGlyUGhGLzNUc0pUVFdMZmxYUE84U0hTTmtJbTk1ZGs1cmt0TUp0QXNO?=
 =?utf-8?B?Mk13RnAybVJwaGtzbE11SWRVM1dvbUsvU3luWlM0S2dTc2VuYSsxemx0VmZ2?=
 =?utf-8?B?SFBZcnFabGRvY2ZOUXQ0d2pnNWk1eFFMdFdHbmp5TEI5cFAyZkR0UlZFL3U2?=
 =?utf-8?B?UkhHbUJpRzVIR1J2ZVdyYW4wNURKUTIxeHJZeEFlTUcrVUs4dDJDUWJiL0cw?=
 =?utf-8?B?aTRPd3EzM04vV1pFMkFwQmlBMjFmQzAxcmpQbld0TkRQNXBscEt6bXJWUWtH?=
 =?utf-8?B?MnVmZEQxR3M4Y216cHEzNXNMRnVZdFptZi9NdmVlS2luK3JHTytzbXNrYlFC?=
 =?utf-8?B?blM2blgwY2VkNDJLWDI2ZTJjQm44bjJySjE0ZjloU1lLNURoM3poQ3NzOU5G?=
 =?utf-8?B?SExlUkJMZmd1ZVZuUkFJeDFWemRyRGU1SkxkWTdDRUtxNmRjdHJTazJzV0R2?=
 =?utf-8?B?R0xNbDFUUkQ0eTNjVE16YjRSVk1HSys1OGlHSDN1WGNNd1RPbnBnTENNWTIy?=
 =?utf-8?B?ZEU0dnNOVm5KZXRHZXVnUER1ZldUNVQ2WVFtTlFBb25CQjhXemppczhqU1pW?=
 =?utf-8?Q?jkVU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4d75b1-5aea-4014-aa2a-08dcfbc5af95
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2024 05:09:25.2688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMi3yy6PvgD0itlbfn2C86sL2yd+DVyb+MT+0MqUMiEa7G5A+K6FA0lcq4bIZPsi+Zd7ULO8R4djjz5cbUxrcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491

DQoNCj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgT2N0b2JlciAzMSwgMjAyNCAxMToxMSBBTQ0KPiANCj4gPiBGcm9tOiBBaXN3YXJ5YSBD
eXJpYWMgKFFVSUMpIDxxdWljX2FjeXJpYWNAcXVpY2luYy5jb20+DQo+ID4gU2VudDogV2VkbmVz
ZGF5LCBPY3RvYmVyIDMwLCAyMDI0IDQ6MDggUE0NCj4gPg0KPiA+IEhpIFBhcmF2LA0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUGFyYXYgUGFuZGl0
IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDMwLCAy
MDI0IDk6MTUgQU0NCj4gPiA+IFRvOiBBaXN3YXJ5YSBDeXJpYWMgKFFVSUMpIDxxdWljX2FjeXJp
YWNAcXVpY2luYy5jb20+OyBBbGV4YW5kZXINCj4gPiA+IEdvcmRlZXYNCj4gPiA+IChRVUlDKSA8
cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT47IEFsYmVydCBFc3RldmUNCj4gPiA+IDxhZXN0ZXZl
QHJlZGhhdC5jb20+OyB2aXJ0aW8tY29tbWVudEBsaXN0cy5saW51eC5kZXYNCj4gPiA+IENjOiBh
Y291cmJvdEBjaHJvbWl1bS5vcmcNCj4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRl
bnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlhIGRldmljZQ0KPiA+ID4NCj4gPiA+IEhpIEFpc3dhcnlh
LA0KPiA+ID4NCj4gPiA+ID4gRnJvbTogQWlzd2FyeWEgQ3lyaWFjIChRVUlDKSA8cXVpY19hY3ly
aWFjQHF1aWNpbmMuY29tPg0KPiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgOSwgMjAy
NCAyOjE3IFBNDQo+ID4gPiA+IFRvOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+OyBB
bGV4YW5kZXIgR29yZGVldiAoUVVJQykNCj4gPiA+ID4gPHF1aWNfYWdvcmRlZXZAcXVpY2luYy5j
b20+OyBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+Ow0KPiA+ID4gPiB2aXJ0aW8t
IGNvbW1lbnRAbGlzdHMubGludXguZGV2OyBBaXN3YXJ5YSBDeXJpYWMgKFFVSUMpDQo+ID4gPiA+
IDxxdWljX2FjeXJpYWNAcXVpY2luYy5jb20+DQo+ID4gPiA+IENjOiBhY291cmJvdEBjaHJvbWl1
bS5vcmcNCj4gPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJ
RCBmb3IgbWVkaWEgZGV2aWNlDQo+ID4gPiA+DQo+ID4gPiA+IEhpIFBhcmF2LA0KPiA+ID4gPg0K
PiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogUGFy
YXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIE9j
dG9iZXIgMSwgMjAyNCAxOjUzIFBNDQo+ID4gPiA+ID4gVG86IEFsZXhhbmRlciBHb3JkZWV2IChR
VUlDKSA8cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT47IEFsYmVydA0KPiA+ID4gPiA+IEVzdGV2
ZSA8YWVzdGV2ZUByZWRoYXQuY29tPjsgdmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2Ow0K
PiA+ID4gPiA+IEFpc3dhcnlhIEN5cmlhYw0KPiA+ID4gPiA+IChRVUlDKSA8cXVpY19hY3lyaWFj
QHF1aWNpbmMuY29tPg0KPiA+ID4gPiA+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcNCj4gPiA+
ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzXSBjb250ZW50OiBSZXNlcnZlIElEIGZvciBtZWRp
YSBkZXZpY2UNCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBGcm9tOiBBbGV4YW5k
ZXIgR29yZGVldiA8cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT4NCj4gPiA+ID4gPiA+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCA0OjM2IFBNDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gT24gMDEvMTAvMjAyNCAxMDozOSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJh
dkBudmlkaWEuY29tPg0KPiA+ID4gPiA+ID4gPj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAy
MDI0IDE6MzUgUE0NCj4gPiA+ID4gPiA+ID4+IFRvOiBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJl
ZGhhdC5jb20+Ow0KPiA+ID4gPiA+ID4gPj4gdmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2
Ow0KPiA+ID4gPiA+ID4gPj4gYWlzd2FyeWEuY3lyaWFjQG9wZW5zeW5lcmd5LmNvbQ0KPiA+ID4g
PiA+ID4gPj4gQ2M6IGFjb3VyYm90QGNocm9taXVtLm9yZw0KPiA+ID4gPiA+ID4gPj4gU3ViamVj
dDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWENCj4gPiA+ID4g
PiA+ID4+IGRldmljZQ0KPiA+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+ID4+IEhpIEFsYmVydCwN
Cj4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+PiBGcm9tOiBBbGJlcnQgRXN0ZXZlIDxhZXN0
ZXZlQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gPiA+PiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJl
ciAyNSwgMjAyNCAxMjoyMCBQTQ0KPiA+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+ID4+DQo+ID4g
PiA+ID4gPiA+PiBPbiBGcmksIFNlcCA2LCAyMDI0IGF0IDk6MDjigK9BTSBBbGJlcnQgRXN0ZXZl
DQo+ID4gPiA+ID4gPiA+PiA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiA+
ID4+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPj4gUmVzZXJ2ZSBkZXZpY2UgSUQgNDkgZm9yIG1lZGlh
IGRldmljZS4NCj4gPiA+ID4gPiA+ID4+IENvbXBhdGlibGUgd2l0aCB2aWRlbyBlbmNvZGVyLCB2
aWRlbyBkZWNvZGVyLCBhbmQgY2FwdHVyZQ0KPiA+IGRldmljZXMuDQo+ID4gPiA+ID4gPiA+Pg0K
PiA+ID4gPiA+ID4gPj4gU2lnbmVkLW9mZi1ieTogQWxiZXJ0IEVzdGV2ZSA8bWFpbHRvOmFlc3Rl
dmVAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiA+ID4+IC0tLQ0KPiA+ID4gPiA+ID4gPj4gwqBjb250
ZW50LnRleCB8IDIgKysNCj4gPiA+ID4gPiA+ID4+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+ID4+IGRpZmYgLS1naXQgYS9jb250
ZW50LnRleCBiL2NvbnRlbnQudGV4IGluZGV4DQo+ID4gPiA+ID4gPiA+PiAwYTYyZGNlLi42ZDZi
M2Q4DQo+ID4gPiA+ID4gPiA+PiAxMDA2NDQNCj4gPiA+ID4gPiA+ID4+IC0tLSBhL2NvbnRlbnQu
dGV4DQo+ID4gPiA+ID4gPiA+PiArKysgYi9jb250ZW50LnRleA0KPiA+ID4gPiA+ID4gPj4gQEAg
LTczOSw2ICs3MzksOCBAQCBcY2hhcHRlcntEZXZpY2UgVHlwZXN9XGxhYmVse3NlYzpEZXZpY2UN
Cj4gPiA+ID4gPiA+ID4+IFR5cGVzfQ0KPiA+ID4gPiA+ID4gPj4gwqBcaGxpbmUNCj4gPiA+ID4g
PiA+ID4+IMKgNDXCoCDCoCDCoCDCoCDCoCbCoCDCoFNQSSBtYXN0ZXIgXFwNCj4gPiA+ID4gPiA+
ID4+IMKgXGhsaW5lDQo+ID4gPiA+ID4gPiA+PiArNDnCoCDCoCDCoCDCoCDCoCbCoCDCoE1lZGlh
IGRldmljZSBcXCBcaGxpbmUNCj4gPiA+ID4gPiA+ID4+IMKgXGVuZHt0YWJ1bGFyfQ0KPiA+ID4g
PiA+ID4gPj4NCj4gPiA+ID4gPiA+ID4+IFRoZSBpZCA0OCByZXF1ZXN0IHdhcyBtYWRlIHNldmVy
YWwgbW9udGhzIGFnbyBpbiBNYXktMjQgZm9yDQo+ID4gPiA+ID4gPiA+PiB1c2IsIG5vIGZ1cnRo
ZXIgaW50ZXJlc3QgaGFzIGJlZW4gc2hvd24gb24gaXQuDQo+ID4gPiA+ID4gPiA+PiBCZXR0ZXIg
dG8gYXZvaWQgaG9sZXMgaW4gdGhlIGRldmljZSBpZCBhc3NpZ25tZW50Lg0KPiA+ID4gPiA+ID4g
Pj4gU28gaWQgNDggd291bGQgYmUgYmV0dGVyIHRvIHVzZSBmb3IgbWVkaWEgdGhhdCBoYXMgaW50
ZXJlc3QuDQo+ID4gPiA+ID4gPiA+PiBBZGRlZCB2aXJ0aW8tdXNiIHByb3Bvc2VyIHRvIHRocmVh
ZCB0byBzZWUgaWYgaXQgaXMgc3RpbGwNCj4gPiA+ID4gPiA+ID4+IGludGVyZXN0aW5nLCBpbiB0
aGF0IGNhc2UNCj4gPiA+ID4gPiA+ID4+IDQ5IHNlZW1zIGdvb2QgaGVyZS4NCj4gPiA+ID4gPiA+
ID4+DQo+ID4gPiA+ID4gPiA+PiBHaXZlbiB0aGUgdm90aW5nIGhhcyBzdGFydGVkLCBJIGFtIG5v
dCBzdXJlIGlmIHRoZSByZWFsIGlkDQo+ID4gPiA+ID4gPiA+PiB2YWx1ZSBtYXR0ZXJzIGFzIGxv
bmcgYXMgb25lIG9mIHRoZSB1bmlxdWUgaWQgaXMgcmVzZXJ2ZWQuDQo+ID4gPiA+ID4gPiA+Pg0K
PiA+ID4gPiA+ID4gPj4gQW5kIGRvIG5vdCBwcmVmZXIgdG8gcmVzdGFydCB0aGUgdm90aW5nIGZv
ciBzdWNoIGEgc21hbGwNCj4gPiA+ID4gPiA+ID4+IGNoYW5nZSBlaXRoZXIgb24gbXkgbGF0ZSBv
YnNlcnZhdGlvbiBvZiB0aGlzIGhvbGUuDQo+ID4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4gPj4g
SSB0aGluayB3aGVuIHRoZSBtYWludGFpbmVyIG1lcmdlcyB0aGUgcHJvcG9zZWQgcGF0Y2ggdG8N
Cj4gPiA+ID4gPiA+ID4+IGFzc2lnbiBpZCA0OCwgc2hvdWxkIGJlIGZpbmUuDQo+ID4gPiA+ID4g
PiA+Pg0KPiA+ID4gPiA+ID4gPj4gTWljaGFlbCwNCj4gPiA+ID4gPiA+ID4+IEFyZSB5b3Ugb2sg
dGhpcyB3YXk/IE9yIHlvdSBoYXZlIGJldHRlciBzdWdnZXN0aW9uPw0KPiA+ID4gPiA+ID4gPj4N
Cj4gPiA+ID4gPiA+ID4+IEFpc2h3YXJ5YSwNCj4gPiA+ID4gPiA+ID4+IElzIHZpcnRpby11c2Ig
c3RpbGwgaW50ZXJlc3Rpbmc/IElmIHNvLCBjYW4geW91IHBsZWFzZQ0KPiA+ID4gPiA+ID4gPj4g
cmVxdWVzdCBmb3IgdGhlIHZvdGU/IFNvIHRoYXQgd2UgYXZvaWQgdGhlIGhvbGUgaW4gZGV2aWNl
DQo+ID4gPiA+ID4gPiA+PiBpZA0KPiA+IGFzc2lnbm1lbnQuDQo+ID4gPiA+ID4gPiA+IEkgcmVj
ZWl2ZWQgYXV0byByZXBseSBmcm9tIEFpc2h3YXJ5YSdzIGVtcGxveWVyIHRoYXQgdGhleQ0KPiA+
ID4gPiA+ID4gPiBhcmUgbm90IHJlYWNoYWJsZQ0KPiA+ID4gPiA+ID4gZHVlIHRvIGFjcXVpc2l0
aW9uLg0KPiA+ID4gPiA+ID4gPiBTbyBub3Qgc3VyZSBpZiB2aXJ0aW8tdXNiIGFuZCA0OCBpcyBz
dGlsbCByZWxldmFudC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFdlIGFyZSBpbnRl
cmVzdGVkIGluIHRoZSB2aXJ0aW8tdXNiIGRldmljZSBhbmQgd291bGQgbGlrZSB0bw0KPiA+ID4g
PiByZXNlcnZlIElEIDQ4IGZvcg0KPiA+ID4gaXQuDQo+ID4gPiA+IEhvd2V2ZXIsIEkgcGxhbiB0
byBwdXNoIGEgdmVyc2lvbiAyIHBhdGNoIHRvIGVuc3VyZSB0aGUNCj4gPiA+ID4gcmVzZXJ2YXRp
b24gY292ZXJzIG5vdCBqdXN0IHRoZSB2aXJ0aW8tdXNiIGhvc3QgY29udHJvbGxlciwgYnV0IHRo
ZSB2aXJ0aW8tDQo+IHVzYiBkZXZpY2UuDQo+ID4gPiA+DQo+ID4gPiBBbnkgcGxhbiB0byByZXF1
ZXN0IGZvciB2aXJ0aW8tdXNiIGRldmljZSBpbiBuZXh0IHR3byB3ZWVrcz8NCj4gPiA+IElmIG5v
dCwgdGhlbiB2aXJ0aW8tbWVkaWEgY2FuIHByb2NlZWQgd2l0aCBJRCA0OCAodGhpcyBpcyB0aGUg
Zmlyc3QNCj4gPiA+IGZyZWUgaWQpIGFuZCBsYXRlciB3aGVuIHlvdSBhcmUgcmVhZHksIHZpcnRp
by11c2IgY2FuIHBpY2sgdGhlIG5leHQgZnJlZSBJRC4NCj4gPiA+IFRoaXMgd2lsbCBoZWxwIHRv
IG5vdCBjcmVhdGUgYW55IGhvbGVzIGZvciBzb21lIGluZGVmaW5pdGUgdGltZSBpbiB0aGUgSUQN
Cj4gbGlzdC4NCj4gPg0KPiA+IFRoYW5rIHlvdSBmb3IgY2hlY2tpbmcgd2l0aCBtZSBhZ2Fpbi4N
Cj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGUgcHJvY2VzcyBvZiB1cGRhdGluZyB0aGUgcGF0Y2ggaXMg
dGFraW5nIGxvbmdlciB0aGFuDQo+ID4gZXhwZWN0ZWQgYW5kIHdlIG1heSBub3QgYmUgYWJsZSB0
byB1cGRhdGUgdGhlIHBhdGNoIGluIG5leHQgMiB3ZWVrcy4NCj4gPiBJIGFtIHJlYWR5IHRvIHJl
c2VydmUgdGhlIG5leHQgZnJlZSBJRCBsYXRlci4NCj4gPg0KPiBUaGFua3MgZm9yIHRoZSBxdWlj
ayBjb25maXJtYXRpb24uDQo+IEluIHRoYXQgY2FzZSB2aXJ0aW8tbWVkaWEgY2FuIHBpY2sgdGhl
IGZpcnN0IGZyZWUgaWQuDQo+IFdpbGwgY2hhbmdlIGFjY29yZGluZ2x5Lg0KPiANCj4gPiBUaGFu
a3MsDQo+ID4gQWlzd2FyeWENCg0KQXBwbGllZCBieSBhc3NpZ25pbmcgdGhlIGZpcnN0IGZyZWUg
aWQgNDguDQo=
