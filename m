Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00716F288
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651605; cv=fail; b=NzHZ5uOc/ktwEpZY381MpcaHxjh9Qs6lvM1MQVaz1X22Byy9ZANhD7ZyIM5feSCdcQG/ft+cC1p5jdnqCX5N7pUA+LosujYqhUgDQ/DnB1ujaB3HTmB/bieJTvtNRcI9+CJtsYLfUXR1yF/2DBkUiP1eVdj5F1OrmFMT3g9TcDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651605; c=relaxed/simple;
	bh=JpqebgGsDbsCSVkZjuR8yzI635U+/uCSDtomzzVd+sU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UZrWPoXC2IrPf3vhmoXg9EXZVwzdmZS/GwGaIlAuXmFzXphgivQk0dbGovxMqfZEiGmylJjZEPWQg/FFLWGrhdG1MmHbNG17yY1xD16TQFPi0zHonQMXN3IBQvosK++uUBFhBFvn5ufL6ke/1uqzca1GQziI8n1qbgHs3m7Fe8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VGC7XR08; arc=fail smtp.client-ip=40.107.95.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VGC7XR08"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9Y2KUQoS4W2cYJLZUFgjHeTivoq++VAo+h888pHOHGEaY52OVlCNRq7kYR309CuYTT8CfjHN8qvK+GrbpUgqTj89W8KXK+npAPq+Jrd7CZqBp9Qqoj0OQBDNaWaCDAd98E8KaZLWjad3jCmUNGu0amOKz56pswEHCfhUDK0lN4aSTFwSxoRk+EpLt1M0+jVV7Y1F18cDYPe76X4/SQnEb4fJRUPYkpxGD/lqZNYCuTx6GdyW9JmypoVpyB5cxIDido57oIaCEteonOM8po6CWQLepwhhw+M8BtB/xeasnRExY/lPj9wsBRxZpw1K5fKXGg24n8WKezI0JdszbRTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpqebgGsDbsCSVkZjuR8yzI635U+/uCSDtomzzVd+sU=;
 b=nOckuznLradBhsu3s/67UWeSjqFC3AeMp2fYj6bwOFRfuxvQJmTPlK8TMw/k448ODaUcAWzKiy1Ccs8oRxmT+vf+Efz2IAA3M5Cm0ZNoR1Z81X7Jii2jd7VQthn5tXp7IUlfwedY65afdxHR6XH7SlI6uXO+AdRc4vcLSzNXP0lR74MJaIGzuCle5odX04YtR/aItAjrkyZdeFASAp6+/OI1uvMGDaP+sXu9fkzVVI89GLO0RbASSXW3a9jxR8QdwaJet5pbeyBT2bPr0/kNmGm215W0vyxOqQJ5Huhof1iNwKLMcWUPOfNWj6yU1yMJSJzC23T1D5YMVJlKNsZgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpqebgGsDbsCSVkZjuR8yzI635U+/uCSDtomzzVd+sU=;
 b=VGC7XR08ajyKpiJTAo3R7V0fFE8QaycF3HnF99mdeGwHvzSzi9pN0B2D8e4mpZqN1NsxSBc5Jj3PUpQaXiu8WFMlptl9cbcKPeynHWNcKaZKjv0LuZCOJnMut6QBBm6jwwCDVtPAfgqSTJ6Ovt0mNiCIYLGuMf2yvEvE3Dicb3lZshjLNUY2d0dMnBNl+RS+YTTIxTN5xdfuHktsFrwcPybdcF0OFDbpVV3eY/gQ2Z+nBuiFwQaVKSGRChNfJaIAUS28J0SoEOnRDlx6rct09funcVsM/Cutw/RXM7/gRGpIW+H0tzp9yErD6LA2iAVsuLeLx925/N2a3X05UASmag==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB5795.namprd12.prod.outlook.com (2603:10b6:8:62::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.18; Thu, 27 Feb 2025 10:19:59 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8466.013; Thu, 27 Feb 2025
 10:19:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: Shiva Shankar Kommula <kshankar@marvell.com>, Jason Wang
	<jasowang@redhat.com>
CC: "pabeni@redhat.com" <pabeni@redhat.com>, "willemb@google.com"
	<willemb@google.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>, Rahul Bhansali
	<rbhansali@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Topic: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Index:
 AQHbgWDwSYToX/CSwkOk56bKWmWaZLNN+nsAgAA074CAAUF3gIAHVNKAgAJdsACAAdORgIAAB1SQ
Date: Thu, 27 Feb 2025 10:19:59 +0000
Message-ID:
 <CY8PR12MB7195255494ABF756FE5414FCDCCD2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250217172509.107212-1-kshankar@marvell.com>
 <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
 <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
 <CACGkMEuUsQuQ5zNu=kqdTQ9-zWsNc3zdFYVre03fuNnE6tKjog@mail.gmail.com>
 <DM4PR18MB42695063456CE2F746EEDB0BDFCD2@DM4PR18MB4269.namprd18.prod.outlook.com>
In-Reply-To:
 <DM4PR18MB42695063456CE2F746EEDB0BDFCD2@DM4PR18MB4269.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB5795:EE_
x-ms-office365-filtering-correlation-id: 244f623b-e52e-4297-619f-08dd57184a53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmU5M2svUVg1b1dncXhmZFZuZEQ2S1FLSzQ0clEwTzR4dDVBalkzSXlsOE1k?=
 =?utf-8?B?M201Vi9Nb2hoK0RTVHVkSkRXbHV0Q1FNYTdyUytMVmRmUXhrb1NxaVdBME1K?=
 =?utf-8?B?bDlDTUc3OFprZ2hoSWZ5R3I5LzluRW5vNFZ4SGNEZ2VvcUhJUVBWOVM0Qkdl?=
 =?utf-8?B?OXBzZ21nRkQvQjNha1RQYmRUZ1ZUeWhVYXVVZXJlYlliS0pINUUyVktOTnR6?=
 =?utf-8?B?UDhNL1BOWjNzODM1ZWU5bXF1QlcrVC9UcTUyVWxhTHZRbU1aakNPUVpua2tM?=
 =?utf-8?B?b0FMTzRvanFhR1N0RTMrVURkVllobjZhRDFsTmFWWXRwWEMrbVRZMlkwZy9J?=
 =?utf-8?B?MVhNTGVaaGphVFFHMm9PWDJRNHdrZmFYVk13TXY3b1J6TWpURHI2bFdHWGoy?=
 =?utf-8?B?eStpV0EwUWFNUFdLNlpZRzlHNlFjQW5mTUZ6TFprMkdYamM5T2ZnazFsQzlJ?=
 =?utf-8?B?TjQ0WUJ5SFR1WEFkNEF4S2hKd1cxaHM0dnl1bVFyMGJiK0N6T2pqQ09tUC9M?=
 =?utf-8?B?dFA4cXJucC9lVzd3UmpQa2hkaGRsRjRpOHNtTVhYWEpwTHo5eTh4ampSbTZ4?=
 =?utf-8?B?QmE2aFZ5TkRMMW5jUEYzc2xDMFVaTzZBcWNSeWROTS9oeWlPQ1lpUWl1c0w1?=
 =?utf-8?B?QkxyZi9UNk82Sy9Db215QzhxNjQ4VTBkUFRNMG1PY3Bnbm14YjA5bmdNQmpU?=
 =?utf-8?B?aTBHTEFONG5uS3ZUV2JwbmNGbE1nWUwzWmFmZmdwMXBRUFJlRGtTb2l2UWR3?=
 =?utf-8?B?WmttV2FKZkFlVXk3SVRSNHBjVHUyVVEyZXJpYUR4bDVhWGJYRWw0T0piaWN0?=
 =?utf-8?B?WncyeVNJUjJpUjJlMG1rUkpnbUkvaEVTN1N3eTJzTTl1S1hZUnlpWFR0YjNs?=
 =?utf-8?B?Z0xrb2xlNExqdno3VTE0NVlMalJDN2krWGhCNGo5KzV2bTZ1OVF0RlVzT0dI?=
 =?utf-8?B?STd5OXUzNnpMMFpYdzhrYm11TFVyajB4US9GNHN0QzBHUVhjQ203OUpqVjZ4?=
 =?utf-8?B?Q0xHNU0xSmRtNE5HWEF0YzFlL3dZSjM2TjFsODlvWGhqZXYvZDhTVTBHaytB?=
 =?utf-8?B?SUNidW9XaFNZQURhQTczcUFYQUpvaEI0T3h5ckxjdHBtZGE5aFFhV1R1YnNX?=
 =?utf-8?B?MnQ5WldlVG04bnJ6Y21PN08raHd6bG1QUDhVWEpTbGJoanB6K1ZOdDBZbFlO?=
 =?utf-8?B?VkhCS29zYnowSHl5RXA0SGNmOUVnT09QTEx1STJqQURBMWMxMnluWThNZ25p?=
 =?utf-8?B?eWh3L3VzcC9SK2UzZmFHVjl6ZzhlUFhvUnZzaXcwcEtvdzE2NFJiWlpheVZF?=
 =?utf-8?B?eGJ2bmxoOHltczFDbDlQNXJFTVQxR3MzZGhrTDZDV04rTTZwNlo4TzRmL3VR?=
 =?utf-8?B?TlZvYXZIQVJJdGJMZWkrREhjeVRoV2RGNzZHbWRxdVpKeGhjTUlwbGw2Q2Jx?=
 =?utf-8?B?VGRQYW9UbVdrRDlVU3hQamMzTnMxQVhKdzdXR1BiTDk3Q0NEaFo0T3o5aFlQ?=
 =?utf-8?B?WFhYWFdrOG5CWjBvektlT3ZMK1R6aTVQMlFtRnNXeDlqd0lUZzJIenlrbUkv?=
 =?utf-8?B?eVRvVjl5UDlkMFlhL1p5bm1JY2V3QWhPUXNMb3ljOGJQL2dGaWxFZ1JWS3c0?=
 =?utf-8?B?MU5ZNXA0ZC9GemUrRTN5Q3BaRFQvV1RRZDI0ZU11Q2xOYWFjK3dZOVV0T1JM?=
 =?utf-8?B?STdqS3dIQk9KT3d0d0FRT3ZPMnU0bHQzMmdTc0lOSXRrd2R2VkJOdWtUbnY5?=
 =?utf-8?B?QVJmRUFaWkRDZnBGZ2ZydmtBN1B2aDZ3VUVvV3FnNEprSE1ua283TkxIWEhr?=
 =?utf-8?B?MDFxb2pNVk1RUUsxdUlNdUNHV09DNjBzejFiRnM0TGM3Q3NuRVF3cldjOFRN?=
 =?utf-8?B?RVNZVEszNXVEUWZnY0dWcklxaWFlQTNQMHpXc05hdVhpWjN2SlNyMXFxOTNi?=
 =?utf-8?Q?AIEa/Ygcw7R5X/QVBPNxUqFpfcmt3Ae2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWFBT2ZvVmhPWUswREhRUU93Z1dhc292b3B0dzBOYlkrZDdwTHl5UFFjdjRU?=
 =?utf-8?B?Z3RGL2IxYzNkOWZPNHNta3pDWFZHeGcrWFVBSE5wMWNFNTgvU3NNTXFOSHEv?=
 =?utf-8?B?UVlGMEEzcEw1VzJFbUVQRW1OamxDZWRybWhsK1o2Y3d3WSs2K3FXV2Z6dlpm?=
 =?utf-8?B?TFdaNlNRYnkxMEtvNmE0aEZ1S0FRLzBKVXo1SEFISkNnbk5OV2JycjVMYnhO?=
 =?utf-8?B?blA5SisrMktic0hWaW9wdlM2a1JTaVhLZ2J1TVlzY1ZrYzNSTThHZHRlVUNV?=
 =?utf-8?B?L2crSENySE5FQ1NDTnFTdUJmODI0bExPeDZRQ0N4MFRMK1c5UmRoWEtQUUJw?=
 =?utf-8?B?dVFyVTNUck1CV2ZWanpUTS90b2NhMG9NOVhTSy90aUxpQlNURGJKcFFQaitN?=
 =?utf-8?B?SGx4bzk5VTZzYXJjV0xSL3ozcjVZeVVNdkNzeko5QzEvVkQvWU1RNTdxNVhs?=
 =?utf-8?B?SzVESTUzUVExVkhScHlBZi83WVhYajdSbjdWenhxQ09wUnNUR3J3OWplSFBt?=
 =?utf-8?B?Uk5DdjVTc29tWkNrOHg2NFplZ20vUW1jV1NlKzgvRVloSUN5VHhkOXFSdFpn?=
 =?utf-8?B?WS9RRUdlLzJyV1dvdmorY0UwL3h3VUE1NG03ZkJ5ZWJUK0RKajR3U01hcWxP?=
 =?utf-8?B?L0lid3JCUDN2d1VkNkZRTUQ3ajhnaXRaQS8xUWNtSTdDVDEzZVpLc3VBeXMy?=
 =?utf-8?B?Z05wLzREbk9pY29oSk5ZaUs1RVRNaHhIVUtKYXVpTGwvVXNxcFhrS245WCtP?=
 =?utf-8?B?S1FnVUxlckpaNnJsZThaWFVqUTU0Ri9RaTRzU2hMS2swMnRxclh0ZjBNb29G?=
 =?utf-8?B?NHZWd1J1bERaaEt3RkxDcmtKMXFmbC82WG0vWFljY3hwV3dtTFJTQ2I5WDVo?=
 =?utf-8?B?N3oyUGVrUjBWaS85RHdOQjdZVWhZQXVjdE01UnliWHA5ekFzaFgrbkVUYlYy?=
 =?utf-8?B?dFM1d1FPREk1bUI1d2kwR1NNS2xnUFpXc01hT1I4aUVXM1JuVUxoa09hRzFQ?=
 =?utf-8?B?L1NsaHRQMGZ5NC9aN3Y0N25SaTdUdEZnbTMvWWEwditxUjlSS2I2ZEdoU1pz?=
 =?utf-8?B?bW82cEhLMklVTkl2VEVjQWVOaVAxckV5M3UxNDZiVzl6QnFRVnk3TzVWcExH?=
 =?utf-8?B?SzFyMndReXUzT1MreWQ0dU8yZEh1QW9tRzlJQXcxOGI2UUhYV3VhODB5UUY2?=
 =?utf-8?B?RXhHRmxEOS83YXEwNWswdERmQUJtU2ZISVluYkxDcEdxZ28zcVlrOFRHWWgr?=
 =?utf-8?B?RXJ4ejFUVHlDbTlPQlMzVkxQRUlnWjNmTExWKzZMWjBEMGtvRnRSeVZBd2py?=
 =?utf-8?B?K2JqdFRoNm5tcEFnL3lpQm5lM0c4WkplWWR0SmsxbjlvOURGWWJYQlJFc3RX?=
 =?utf-8?B?aXROL1pGY2gwV1o0RzRRTUtSMUpKWjQ3SkR2YmI1S3lxLzBiOStPbENCQ3Bn?=
 =?utf-8?B?RnRwQ0k3alAwWEZ0WVJxQlFWTTA0SGRQUnFlaFFtYllNUWk0Q1IwREYzOEFr?=
 =?utf-8?B?dDcwOExkcVUrR2I3eHdkNGE0Y0pBZGs3M0JDdGVGVDA3MDVwSlBBK2EvakJO?=
 =?utf-8?B?TG00RU4rVXpVOUlBUzJ3djZGejhQS2NlQVB3Zm4vTzZKVEZSc2JJZk9PVlpK?=
 =?utf-8?B?YXdMVGlHQk1DQjRRUW9hQUVIQjJKM294WVVMb2xNNDNyaXRWaWZlMkNVb1Mv?=
 =?utf-8?B?S3lmeERpaCs3QXltWG1kYXI1bE5XVHphdk1CbGswcFQwaDJvZWpyL2Y0bk1T?=
 =?utf-8?B?Zmk1d1c0aGQyazhXM1pJYnhlU1p0NFFPWFRDZHhlQU5rb3RzZXhGZ3J6V1ZO?=
 =?utf-8?B?NWUvUmJxb3M1aUJvYWlmL3RvSFdaTXIyQzdxSmJodXp5Zi9weGVpdzVLUi80?=
 =?utf-8?B?Zjk1Yko2cHY1U1JiZzNmbzhiUHROVkprR08vRWtXWk1EMzdpY1lqSnhNZkN2?=
 =?utf-8?B?b1V1VCtFM2RvQ2k1aEl6RFRXQzRvV3M2b1FEQXJUWS9Ra0NtaFFTSTZnRUNT?=
 =?utf-8?B?SlJEZTFCdXBiYzhhTVM2ZFpnNXRVQXZUb1NqbFZBL28zK21UbkFnL3QrOEcv?=
 =?utf-8?B?ck4wNEVPY2ErSEhtamNydTk1L2FPTjZsdU54ZGdtVFdnVUp5UU5ZdWFOQnhU?=
 =?utf-8?B?ZWd5YkZYd2JzY252ZEdPd1Q5YkFCMEI4ZXhHNFYwUDJlUVN4bERGVFJ3NVUv?=
 =?utf-8?Q?RS69Ccl8H77YQWBlWyAbgu4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 244f623b-e52e-4297-619f-08dd57184a53
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 10:19:59.3939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vszojUPhgcDUFZBQD5hKIIFjj7sQD46suIHhwnKon4W69E7+2t8N8dMOYHyMz5KjX0OxmzPKq0az6wy7GW+e6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5795

DQo+IEZyb206IFNoaXZhIFNoYW5rYXIgS29tbXVsYSA8a3NoYW5rYXJAbWFydmVsbC5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyNywgMjAyNSAzOjE5IFBNDQoNCj4gPiBOZXcgZmll
bGRzIHdlcmUgYWRkZWQgd2hlbiBuZXcgZmVhdHVyZXMgd2VyZSBhZGRlZC4gSXQgZG9lc24ndCBo
YXJtDQo+ID4gdG9vIG11Y2ggYXMgbG9uZyBhcyBpdCBkb2Vzbid0IGNvc3QgbW9yZSB0aGFuIG9u
ZSBjYWNoZWxpbmUuDQpIYXZlIHlvdSBjb25zaWRlcmVkIHRvIGhhdmluZyBmaXhlZCB2bmV0IGhl
YWRlciBvZiA2NEIgc2l6ZSBmb3IgdGhpcyArIGFueSBuZXcgZmllbGRzPw0KVGhpcyBlbGltaW5h
dGVzIHRoZSBleGlzdGluZyBwcm9ibGVtIHdoZXJlIGEgcGFydGlhbCBjYWNoZSBsaW5lIGNhbiBi
ZSB3cml0dGVuIGZvciB0aGUgdm5ldCBoZWFkZXIgb24gcnggcGF0aC4NCkJlY2F1c2UgdGhlIGRh
dGEgaXMgdHlwaWNhbGx5IHdyaXR0ZW4gYnkgb25lIERNQSBhbmQgdm5ldCBoZWFkZXIgYXMgc2Vj
b25kIERNQSBhcyB0aGV5IG9yaWdpbmF0ZSBmcm9tIGRpZmZlcmVudCBzb3VyY2VzIHdpdGhpbiB0
aGUgZGV2aWNlLg0KQSBkZXZpY2UgY2FuIGFsd2F5cyBkbyBzaW5nbGUgRE1BIHRvbyB0byBhdm9p
ZCBwYXJ0aWFsIGNhY2hlIGxpbmUgd3JpdGUgYnV0IGl0IGRvZXMgbm90IHNlZW0gcHJhY3RpY2Fs
IGVub3VnaC4NCg==
