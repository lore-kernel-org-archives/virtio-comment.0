Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C48C0B
	for <virtio-comment@lists.linux.dev>; Thu, 31 Oct 2024 05:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730353282; cv=fail; b=OOPMvH+ybS7/Gn9LcYgx6AjdiodsP6o974R/eDJumQYflICT+FCOcZNWvRTrfhJ/3Ss0TyMxDLNkBX9JAtEXd2n3GQe5IPwqo4mAm2MnEbtG7oXh/l9rlvWzcv6Cm69svBIByN0f0twMT/KTk8vn5QYG5SPE28pnMDleMe8rtUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730353282; c=relaxed/simple;
	bh=e0YnOvQZglEEf1e9/PUyA7sfRsOrqwpMQO5OTWfgAGQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=raZZ1hPUULIPhtqG9uo8a7jdp1Wn8olmfC8OGhKlwXHhXZPC5//L4JzIGnJny6B68FH0gDb0yZqNHxnbZVMyiOjyhLEFDeS9N8ewvap2PjfFF2Rd24dA5f3V6sQpfKSOiEw+bwEeaJxVHElA9EWtAeNJ108nku5+/mSp+xBloCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=naNJR0w5; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="naNJR0w5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xe1jlDrkG9LXq7FOnwGzkGPuOW+uLK0U6t7dGNwWqUFU1pFn0XRPsnkqBnzEy+MUt3F2pHSUvAbd0gMFC4vmvQxktMHlu7i6LWDgPMrvwG82Kxw7DyNRgM5hCqwiI4HKD0rQacQ9jkjabcwm5GJGdz18zLdcf8/V3vOHGwGPNvLa3RRDocLL79mFDeFv3tILC9naFro9YvRb7OVxR2A1gFzXJ5cLC4nDgOeuoCFWxcp2ynM7wMjEB77HmksqOLxXFIHFEMC7jAP9l6qrXwt1zoEPpR/2yFSvuYsLFVX8BCGnT0PpUhjs2X3A5XL8I5oqf+bipX+WimrnHXoiorQ+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0YnOvQZglEEf1e9/PUyA7sfRsOrqwpMQO5OTWfgAGQ=;
 b=Qay6zkVqiIkSEkWJekPtcfO5fwokwH1IkpmfhjcULKhNZeP29z+YgZn662074ZRqbRkLuaQ9FiWPCI0AzAwWIRUtARMD8OhsNcKGu0hmr307RivzTMKykvzfLe/GHhLM/8Z9YucDSqOOOM5a5C6t7Vh6oqPYlPUfJ2DFT+DGsXrqPKU6G5htH9ZHhNIe1+vdXc4rvV08TyHAMIfMh0QiUKB87MYAZn/CFAWVKTk0qGXeGS1bKg97bGn1Ov8uL7suJs2GBH1ykeggIlGUc4oBiEA1ZQJH5VxrxLlMnDOHlE1YrsQNRzSyVKZLS9e4w+O/wyw+YvcoMp0B45F5bkEImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0YnOvQZglEEf1e9/PUyA7sfRsOrqwpMQO5OTWfgAGQ=;
 b=naNJR0w5mkjVpgyocNKHnUqjw00KncEJcSHqmXOJ2f8ZKTIPQkgH9HgsaH47vn2CEYfZD0vwgo+gdsETdivSEtVtPZQo1NyQliiRChQkCl4/2AwLvLqDb0ByEMFFzq/f+rSX25PW91mvRd2SNj+aTADJQtqdIo9W2+yJ/7qe7/v68+AWfMHtZ90OcsDZSIONaYm36jRv+hBEyLQFomOsC/WHQpOX5ImLCKlG+LHr8UXULtAztXIkKndvtd/jUo9t6aAj7z+rJbUXqV+kqlJo8QGv072pYVFPQ6+b2vvFn3oEkmKvpapaJuIDYR7Sbu1nEu+AiYnymmoX8y0G9eqDpw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 05:41:14 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 05:41:14 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Aiswarya Cyriac (QUIC)" <quic_acyriac@quicinc.com>, "Alexander Gordeev
 (QUIC)" <quic_agordeev@quicinc.com>, Albert Esteve <aesteve@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index:
 AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUIAAKTQAgAAMvECADF83gIAg93dQgAAoi4CAAT8BgA==
Date: Thu, 31 Oct 2024 05:41:14 +0000
Message-ID:
 <CY8PR12MB71950F2D819130F83939E8C8DC552@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
 <MN2PR02MB70075F9F639AFB00B9142A3690542@MN2PR02MB7007.namprd02.prod.outlook.com>
In-Reply-To:
 <MN2PR02MB70075F9F639AFB00B9142A3690542@MN2PR02MB7007.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM6PR12MB4091:EE_
x-ms-office365-filtering-correlation-id: 9b41e290-ddb1-4755-c47d-08dcf96ea283
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2NuNk9SS25LZTVtVzZaUXhEN294eHp5L0p1enVyZGdlUjB3R3cxS2JMaElm?=
 =?utf-8?B?WDRtblZqYjkxOHRubTFXSGRoVEpVZEdlSlBaSWV6UEtlUG5CeGlNV3AxMzBP?=
 =?utf-8?B?ZzJkTGlOUkVGOEZ0TkVRWUFwSUwxS1haREYvWWZHYUQ3cjIyT0FVK2ZpSDc3?=
 =?utf-8?B?RU5tTXdPbTkxL0g4RlFQSitYNTZBMmEwSVlmbnZwZE5BTzBKa3R2Zm5uSmJ0?=
 =?utf-8?B?ZURoQmZ4Ujk5T2dxT2JvMEwxc1pKajk5QnpBWng1Y0VmeFJVN0cvdWhJQ01X?=
 =?utf-8?B?RTBucStoWmZmekxZSDVuQ1NYeFpianRJUklhdnRrK21xaEZjTDdYQW1MZUxl?=
 =?utf-8?B?OFdXbmJnNy9Vem5sWi84M05KUFNrUHgzVGEvMjdpUXIyWFFlTEhTMkkrZDVu?=
 =?utf-8?B?ODRZVythWXQrMW12NUtOVzc5QWJqbEoxcVN3QW9ZMEhoQWswTnhTWXF1K0V1?=
 =?utf-8?B?Z2I2SXdSRVMxZUlOZENGdmlFbnBjbGVWVXhMcGUrTEh3SDlyQ2ZsN05rMEEv?=
 =?utf-8?B?SWFFTnFFWDNpZU5RczZZWlkxYkEyL2JTVnJFL2JnSlFrTHA3aWlYUHV3Mk01?=
 =?utf-8?B?ZG1mVXlMTWMycDNaMEl6Ni9rZXhnelZKSkJWdWhEZlhUejlZekZrTFJUZEMv?=
 =?utf-8?B?MGQ3V25MY2s3Qy9sWko3djljb1JnbGFSZzBxMnBQVlAxK29DdEh4cW52NFk2?=
 =?utf-8?B?cVovRU5iOGtkQ2dTeDZFOVpBaERMdVNPYVhzTDBCVXZkUDRIQ2UrNnNHRkNG?=
 =?utf-8?B?NWhxcmNyeW9GUkp4K0dlNzF1blhtNjJrTURhaEdFZmFYc29TMTlnaWVRcVVC?=
 =?utf-8?B?QXBWcUY5QkFYVHc0VXExbXJvaEdlVldUUVE3R3dvbFhkaXVWQnZta1NiWCtG?=
 =?utf-8?B?ZnZDZEVnd0RaRkw1V3liQ3prdklJbml3UGN1amJ3SW1iRHQvSHFOWnFNRjA1?=
 =?utf-8?B?SVJIU1BKL09jOGlNaWhYdWtVS1ZESjE2VHVaNmY0a3J3ZVFhdGdIVVFVMWFY?=
 =?utf-8?B?azQrY3Q1Z2RjV2cwRFhmaWpzSURSRWtWTXlnaWYwTSt5YjBaa2FoaDJBTVRZ?=
 =?utf-8?B?ODk2WWcvZ0xGbFF4c3pJSVhKNC9PNWIxTElMbE51VmV1VDRiRE1sQjZlNkdU?=
 =?utf-8?B?MlhRQ2VJTFd4ZlByR2VoMk4weEhvanpNUGpyczVhV3A5ZWJONWNzcU9RZVRj?=
 =?utf-8?B?bTFvOG8zTDVkS0JVeXo1UmRTVk8zVjgzYUZQMnBqMFgwZDBaSVZSeE1aK0x2?=
 =?utf-8?B?Sjk3NTNFQmVQaVdKbWR2MWxNQUhYcitxSlVOSmlrdVVpaXB5VmE0WlVycCtL?=
 =?utf-8?B?M0dPdVluQlJ2d1dFRzI2akN6Qlc5bldoUFVZT3o1WmNiQVBmVDJIcXVSOU9r?=
 =?utf-8?B?MDlUcVFaNXJmQ3dnRVdPQWk2dWhLQmJsbWJOZi94M2VEcGhUQXl1UytZRU1l?=
 =?utf-8?B?ZUcwZ3Jqb3FFVkJtNGJ1b3dLM1RwQ3RTRUlDeks0SmxETmFyaGp4d3JJeWhp?=
 =?utf-8?B?NzNhNW1KUXJHNzloU3FMMGMwaVpjTDQrVWRTRktUbWJqb3BYMXJzc25mQTNK?=
 =?utf-8?B?L1ZGejV3bjlNNytKNlk3Qlg0amFDUEdSeGZIS2xJVk4yU28ydDIzN2tnbzVk?=
 =?utf-8?B?bkZkMHNmbzJHYnhaWkVPenJCQWc0Q1M5NXZGRjJoZnF0b01LZUlRMWF4Tkor?=
 =?utf-8?B?QWc3bkdqejk5YzhuUXByeWRaWldhZmdlN3QvV2U1bHlCOGgxZndqK0RmK1VR?=
 =?utf-8?B?TzArTXpMVHFNckpVd3QrWWlFQlFPT1dZanNkbUNLTm5oMUVqb3BURllmMmMr?=
 =?utf-8?Q?P6hCME1d1SGXt6un6pBMcafqLBv9Bli+1S6G4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXJSQ0plMFlyL0pqdDNpeGpPdXJzb0o5ZGtyQ2gxc2o3RmRYYzBvQU9YcmhX?=
 =?utf-8?B?MGV6cmhZZnZEMnN0NDFiRlNxc3hsaXR1MXlIb2s4L0Zlclpvd1ZLVUFubWFy?=
 =?utf-8?B?WTQ1VlBHOGl3NDlhR3JkVXNsY1NCK240dU5OWjVuVzc5UXIyYUExb2Q0NWh1?=
 =?utf-8?B?NEYzTFNRSCt5c3Q5MDN1WEhIRUdlb1dXQjJVVis2UWd6bmJvQ29nVXpkZFQ3?=
 =?utf-8?B?NWdld1Q0eXNycVRQWTBOM2l5bFNBVlN3OWF6VndCVjVpUjBtLzhlS2JyUVl6?=
 =?utf-8?B?YWM0ZDZMWXViMlVZeU5KeDN3N1pGVlNqcEpiWGVQTS95c2lLb0M2eEZxNHYz?=
 =?utf-8?B?QmlubHBHUmdoUjNaNEdsaTdzaEZZTktIZzlpdGZkSzN4RGdCang1Nmo1VE5V?=
 =?utf-8?B?b2lnRnNZcG5RYnFGMXd0RXlRTkN5b3VKU1p4bS85aEVvQ3ltVmhSRnRYU2Jr?=
 =?utf-8?B?MzlHTVNZRm5vRDNybDFtOENTdDFjM21ESVYrSDV2Ni94Q1JtR25UdDg3SmM0?=
 =?utf-8?B?TE5DZ2JNYXRVaWg1MWNFUlRjSy8xdEd1QkNuMmt5QzV1bzVtbm84R3JVVWhE?=
 =?utf-8?B?cjVEd09CRTU3OTNPcmZtVEVGSkRpditxUWVibStUSU1CLzVLeDJIU2I1WnZN?=
 =?utf-8?B?Tlg1Ujg2Z3FyUDM5dXgwdzNKNDdyQXZmWFV4Wk5jMzVEa21qcjhmbjZFeFRS?=
 =?utf-8?B?RHl1QzlDQjJJMmJYQU5pS1dseCs0algySVhGQ0JwOW5sTWYzeDdSUXYrSEZ3?=
 =?utf-8?B?Q3NwSE0ya0I5M3pVMGJ1QjlXZ0hUcENleEFJMm9qbSs4czlUV0k0ZGJacVNW?=
 =?utf-8?B?dmRpNWNCaUh3YjYxZkRtYXRuRzBPaFBmQmtiNGZONUEyMUgyOEUwTmtvMlJW?=
 =?utf-8?B?TTEzeXgrcXJ0TFhHb1UyL3RxeDBUYm1TK0l5RlpWM0FMZGZNcmgzbDBVcGFM?=
 =?utf-8?B?TWE0UGJ3dU96eU83emY5OFhIcnJjK0RLOTFWcTNwbDByeUtzeU1HSnhxMjEx?=
 =?utf-8?B?MVpRTHJ6SFNValZUc28xMVh4N01OZ1RVY0NSeitYS0ZIakFjZGFaTWhGNENl?=
 =?utf-8?B?QVlXU0RHeGgvdGFKalppenEzcU1acmdpTVBmN1lIWndSU0t0N2NZZTlOZDB4?=
 =?utf-8?B?aG0yb2pSSlFyRVo1enFITkFJMjBLSlRzWWZvTUVmV1NRTXJXTG5ia2h0aU9z?=
 =?utf-8?B?cTZOUHRVR0dRdXg5Z2d2alhXQ0NYamZlVUxFWWkyc1hkRTVMUlhMb0NOcXJP?=
 =?utf-8?B?Z2dhT0ppLzloN1BvYWlBZ0tVaVNiekdsQnI5YnMvMy8wRkRxN0tWeXhaYnFD?=
 =?utf-8?B?blBuU1VTZEtrTGNxTnF1M3FZbmdKcFBRYkZETVRUbUtTbysvSHp5dXo2WlBQ?=
 =?utf-8?B?QlducEsyNjdVdHdQUG9VVVhwZ09sU1VJeWgxaktUSE1PUGZOeUhOT214K21k?=
 =?utf-8?B?Y0VWWFRBcndPQ0ZJOGpoZHY3a1R2MWFxdHVKbklPUEZjUjdHYktVSXVWOGRE?=
 =?utf-8?B?Zk9FdHhheHZFT0ZVL0d1U0xJZXBWTXFTVHZtMmNhK0lZVnBaRzRkSnhob01M?=
 =?utf-8?B?dXdEWVpNeURYUjF5bmN0YXp3RmY4eUxIejQ1TjBIN0hrcDVFZThPN2tzK0J5?=
 =?utf-8?B?SVU5L2UxUW5OaWY3VzJremZDTWNnV1Z6Skw2bzhoZk9XczZRSitQMEJMQjRh?=
 =?utf-8?B?SXcyYXduZDBCQU5mTFdjeTdLTitSODFQZ1l5NlN4Um4xQm9yWEM5YmM5dzVL?=
 =?utf-8?B?MnpIV0NhZkZVQzlWT1dKUE5DdjZWeXhzdDRpMEltekJJSXdqMDRpOEQ2TnpG?=
 =?utf-8?B?U2g4TFJpdTUydnlPSklqM3lpc2NQcElVdUhLYzlGcnFoZ0xabEFCN1pZVHVE?=
 =?utf-8?B?UVowSXpXYlVQWlAvZ2llelVmZFpXTVJYbjUzaXg1UkFJRzUzdlNHUFloMGg5?=
 =?utf-8?B?OXdpTVp6cTgvMzhVd3NLZml3TXZwUjNjMVNhOHo5YmovditPRXVuMFZNOHhU?=
 =?utf-8?B?N3BpUzNvVE1CbmZoeW43cHQvMVFHMXBrSHRlRlEvMEo0U3RWRllhendaS3ly?=
 =?utf-8?B?OTNBRnd3V1hEb3pIa1FEVHhpNEx0OHdXYUR6blhvZ0ZZYjgrNGdOMXcrRXcz?=
 =?utf-8?Q?uSCQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b41e290-ddb1-4755-c47d-08dcf96ea283
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 05:41:14.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HZk1Of9muCJ8q1nArRCXHekTzW6tsPF8Eqa6MvDXeFYNn9NzdaeIi8F2eQWDLHNEXp9qik7WHmLB77Wo1MxOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091

DQoNCj4gRnJvbTogQWlzd2FyeWEgQ3lyaWFjIChRVUlDKSA8cXVpY19hY3lyaWFjQHF1aWNpbmMu
Y29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAsIDIwMjQgNDowOCBQTQ0KPiANCj4g
SGkgUGFyYXYsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
UGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgT2N0
b2JlciAzMCwgMjAyNCA5OjE1IEFNDQo+ID4gVG86IEFpc3dhcnlhIEN5cmlhYyAoUVVJQykgPHF1
aWNfYWN5cmlhY0BxdWljaW5jLmNvbT47IEFsZXhhbmRlcg0KPiA+IEdvcmRlZXYNCj4gPiAoUVVJ
QykgPHF1aWNfYWdvcmRlZXZAcXVpY2luYy5jb20+OyBBbGJlcnQgRXN0ZXZlDQo+ID4gPGFlc3Rl
dmVAcmVkaGF0LmNvbT47IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldg0KPiA+IENjOiBh
Y291cmJvdEBjaHJvbWl1bS5vcmcNCj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzXSBjb250ZW50
OiBSZXNlcnZlIElEIGZvciBtZWRpYSBkZXZpY2UNCj4gPg0KPiA+IEhpIEFpc3dhcnlhLA0KPiA+
DQo+ID4gPiBGcm9tOiBBaXN3YXJ5YSBDeXJpYWMgKFFVSUMpIDxxdWljX2FjeXJpYWNAcXVpY2lu
Yy5jb20+DQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgOSwgMjAyNCAyOjE3IFBNDQo+
ID4gPiBUbzogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPjsgQWxleGFuZGVyIEdvcmRl
ZXYgKFFVSUMpDQo+ID4gPiA8cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT47IEFsYmVydCBFc3Rl
dmUgPGFlc3RldmVAcmVkaGF0LmNvbT47DQo+ID4gPiB2aXJ0aW8tIGNvbW1lbnRAbGlzdHMubGlu
dXguZGV2OyBBaXN3YXJ5YSBDeXJpYWMgKFFVSUMpDQo+ID4gPiA8cXVpY19hY3lyaWFjQHF1aWNp
bmMuY29tPg0KPiA+ID4gQ2M6IGFjb3VyYm90QGNocm9taXVtLm9yZw0KPiA+ID4gU3ViamVjdDog
UkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2aWNlDQo+ID4g
Pg0KPiA+ID4gSGkgUGFyYXYsDQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gPiBGcm9tOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4g
PiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCAxOjUzIFBNDQo+ID4gPiA+IFRvOiBB
bGV4YW5kZXIgR29yZGVldiAoUVVJQykgPHF1aWNfYWdvcmRlZXZAcXVpY2luYy5jb20+OyBBbGJl
cnQNCj4gPiA+ID4gRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+OyB2aXJ0aW8tY29tbWVudEBs
aXN0cy5saW51eC5kZXY7DQo+ID4gPiA+IEFpc3dhcnlhIEN5cmlhYw0KPiA+ID4gPiAoUVVJQykg
PHF1aWNfYWN5cmlhY0BxdWljaW5jLmNvbT4NCj4gPiA+ID4gQ2M6IGFjb3VyYm90QGNocm9taXVt
Lm9yZw0KPiA+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzXSBjb250ZW50OiBSZXNlcnZlIElE
IGZvciBtZWRpYSBkZXZpY2UNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiBGcm9tOiBBbGV4
YW5kZXIgR29yZGVldiA8cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT4NCj4gPiA+ID4gPiBTZW50
OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIwMjQgNDozNiBQTQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
T24gMDEvMTAvMjAyNCAxMDozOSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEu
Y29tPg0KPiA+ID4gPiA+ID4+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCAxOjM1IFBN
DQo+ID4gPiA+ID4gPj4gVG86IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT47DQo+
ID4gPiA+ID4gPj4gdmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2Ow0KPiA+ID4gPiA+ID4+
IGFpc3dhcnlhLmN5cmlhY0BvcGVuc3luZXJneS5jb20NCj4gPiA+ID4gPiA+PiBDYzogYWNvdXJi
b3RAY2hyb21pdW0ub3JnDQo+ID4gPiA+ID4gPj4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29u
dGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2aWNlDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4g
PiA+PiBIaSBBbGJlcnQsDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBGcm9tOiBBbGJlcnQg
RXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gPj4gU2VudDogV2VkbmVzZGF5
LCBTZXB0ZW1iZXIgMjUsIDIwMjQgMTI6MjAgUE0NCj4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4+
DQo+ID4gPiA+ID4gPj4gT24gRnJpLCBTZXAgNiwgMjAyNCBhdCA5OjA44oCvQU0gQWxiZXJ0IEVz
dGV2ZQ0KPiA+ID4gPiA+ID4+IDxtYWlsdG86YWVzdGV2ZUByZWRoYXQuY29tPg0KPiA+ID4gPiA+
ID4+IHdyb3RlOg0KPiA+ID4gPiA+ID4+IFJlc2VydmUgZGV2aWNlIElEIDQ5IGZvciBtZWRpYSBk
ZXZpY2UuDQo+ID4gPiA+ID4gPj4gQ29tcGF0aWJsZSB3aXRoIHZpZGVvIGVuY29kZXIsIHZpZGVv
IGRlY29kZXIsIGFuZCBjYXB0dXJlDQo+IGRldmljZXMuDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4g
PiA+PiBTaWduZWQtb2ZmLWJ5OiBBbGJlcnQgRXN0ZXZlIDxtYWlsdG86YWVzdGV2ZUByZWRoYXQu
Y29tPg0KPiA+ID4gPiA+ID4+IC0tLQ0KPiA+ID4gPiA+ID4+IMKgY29udGVudC50ZXggfCAyICsr
DQo+ID4gPiA+ID4gPj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPiA+
ID4gPj4NCj4gPiA+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvY29udGVudC50ZXggYi9jb250ZW50LnRl
eCBpbmRleCAwYTYyZGNlLi42ZDZiM2Q4DQo+ID4gPiA+ID4gPj4gMTAwNjQ0DQo+ID4gPiA+ID4g
Pj4gLS0tIGEvY29udGVudC50ZXgNCj4gPiA+ID4gPiA+PiArKysgYi9jb250ZW50LnRleA0KPiA+
ID4gPiA+ID4+IEBAIC03MzksNiArNzM5LDggQEAgXGNoYXB0ZXJ7RGV2aWNlIFR5cGVzfVxsYWJl
bHtzZWM6RGV2aWNlDQo+ID4gPiA+ID4gPj4gVHlwZXN9DQo+ID4gPiA+ID4gPj4gwqBcaGxpbmUN
Cj4gPiA+ID4gPiA+PiDCoDQ1wqAgwqAgwqAgwqAgwqAmwqAgwqBTUEkgbWFzdGVyIFxcDQo+ID4g
PiA+ID4gPj4gwqBcaGxpbmUNCj4gPiA+ID4gPiA+PiArNDnCoCDCoCDCoCDCoCDCoCbCoCDCoE1l
ZGlhIGRldmljZSBcXCBcaGxpbmUNCj4gPiA+ID4gPiA+PiDCoFxlbmR7dGFidWxhcn0NCj4gPiA+
ID4gPiA+Pg0KPiA+ID4gPiA+ID4+IFRoZSBpZCA0OCByZXF1ZXN0IHdhcyBtYWRlIHNldmVyYWwg
bW9udGhzIGFnbyBpbiBNYXktMjQgZm9yDQo+ID4gPiA+ID4gPj4gdXNiLCBubyBmdXJ0aGVyIGlu
dGVyZXN0IGhhcyBiZWVuIHNob3duIG9uIGl0Lg0KPiA+ID4gPiA+ID4+IEJldHRlciB0byBhdm9p
ZCBob2xlcyBpbiB0aGUgZGV2aWNlIGlkIGFzc2lnbm1lbnQuDQo+ID4gPiA+ID4gPj4gU28gaWQg
NDggd291bGQgYmUgYmV0dGVyIHRvIHVzZSBmb3IgbWVkaWEgdGhhdCBoYXMgaW50ZXJlc3QuDQo+
ID4gPiA+ID4gPj4gQWRkZWQgdmlydGlvLXVzYiBwcm9wb3NlciB0byB0aHJlYWQgdG8gc2VlIGlm
IGl0IGlzIHN0aWxsDQo+ID4gPiA+ID4gPj4gaW50ZXJlc3RpbmcsIGluIHRoYXQgY2FzZQ0KPiA+
ID4gPiA+ID4+IDQ5IHNlZW1zIGdvb2QgaGVyZS4NCj4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4+
IEdpdmVuIHRoZSB2b3RpbmcgaGFzIHN0YXJ0ZWQsIEkgYW0gbm90IHN1cmUgaWYgdGhlIHJlYWwg
aWQNCj4gPiA+ID4gPiA+PiB2YWx1ZSBtYXR0ZXJzIGFzIGxvbmcgYXMgb25lIG9mIHRoZSB1bmlx
dWUgaWQgaXMgcmVzZXJ2ZWQuDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBBbmQgZG8gbm90
IHByZWZlciB0byByZXN0YXJ0IHRoZSB2b3RpbmcgZm9yIHN1Y2ggYSBzbWFsbA0KPiA+ID4gPiA+
ID4+IGNoYW5nZSBlaXRoZXIgb24gbXkgbGF0ZSBvYnNlcnZhdGlvbiBvZiB0aGlzIGhvbGUuDQo+
ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBJIHRoaW5rIHdoZW4gdGhlIG1haW50YWluZXIgbWVy
Z2VzIHRoZSBwcm9wb3NlZCBwYXRjaCB0bw0KPiA+ID4gPiA+ID4+IGFzc2lnbiBpZCA0OCwgc2hv
dWxkIGJlIGZpbmUuDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBNaWNoYWVsLA0KPiA+ID4g
PiA+ID4+IEFyZSB5b3Ugb2sgdGhpcyB3YXk/IE9yIHlvdSBoYXZlIGJldHRlciBzdWdnZXN0aW9u
Pw0KPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPj4gQWlzaHdhcnlhLA0KPiA+ID4gPiA+ID4+IElz
IHZpcnRpby11c2Igc3RpbGwgaW50ZXJlc3Rpbmc/IElmIHNvLCBjYW4geW91IHBsZWFzZQ0KPiA+
ID4gPiA+ID4+IHJlcXVlc3QgZm9yIHRoZSB2b3RlPyBTbyB0aGF0IHdlIGF2b2lkIHRoZSBob2xl
IGluIGRldmljZSBpZA0KPiBhc3NpZ25tZW50Lg0KPiA+ID4gPiA+ID4gSSByZWNlaXZlZCBhdXRv
IHJlcGx5IGZyb20gQWlzaHdhcnlhJ3MgZW1wbG95ZXIgdGhhdCB0aGV5IGFyZQ0KPiA+ID4gPiA+
ID4gbm90IHJlYWNoYWJsZQ0KPiA+ID4gPiA+IGR1ZSB0byBhY3F1aXNpdGlvbi4NCj4gPiA+ID4g
PiA+IFNvIG5vdCBzdXJlIGlmIHZpcnRpby11c2IgYW5kIDQ4IGlzIHN0aWxsIHJlbGV2YW50Lg0K
PiA+ID4gPiA+DQo+ID4gPg0KPiA+ID4gV2UgYXJlIGludGVyZXN0ZWQgaW4gdGhlIHZpcnRpby11
c2IgZGV2aWNlIGFuZCB3b3VsZCBsaWtlIHRvIHJlc2VydmUNCj4gPiA+IElEIDQ4IGZvcg0KPiA+
IGl0Lg0KPiA+ID4gSG93ZXZlciwgSSBwbGFuIHRvIHB1c2ggYSB2ZXJzaW9uIDIgcGF0Y2ggdG8g
ZW5zdXJlIHRoZSByZXNlcnZhdGlvbg0KPiA+ID4gY292ZXJzIG5vdCBqdXN0IHRoZSB2aXJ0aW8t
dXNiIGhvc3QgY29udHJvbGxlciwgYnV0IHRoZSB2aXJ0aW8tdXNiIGRldmljZS4NCj4gPiA+DQo+
ID4gQW55IHBsYW4gdG8gcmVxdWVzdCBmb3IgdmlydGlvLXVzYiBkZXZpY2UgaW4gbmV4dCB0d28g
d2Vla3M/DQo+ID4gSWYgbm90LCB0aGVuIHZpcnRpby1tZWRpYSBjYW4gcHJvY2VlZCB3aXRoIElE
IDQ4ICh0aGlzIGlzIHRoZSBmaXJzdA0KPiA+IGZyZWUgaWQpIGFuZCBsYXRlciB3aGVuIHlvdSBh
cmUgcmVhZHksIHZpcnRpby11c2IgY2FuIHBpY2sgdGhlIG5leHQgZnJlZSBJRC4NCj4gPiBUaGlz
IHdpbGwgaGVscCB0byBub3QgY3JlYXRlIGFueSBob2xlcyBmb3Igc29tZSBpbmRlZmluaXRlIHRp
bWUgaW4gdGhlIElEIGxpc3QuDQo+IA0KPiBUaGFuayB5b3UgZm9yIGNoZWNraW5nIHdpdGggbWUg
YWdhaW4uDQo+IFVuZm9ydHVuYXRlbHksIHRoZSBwcm9jZXNzIG9mIHVwZGF0aW5nIHRoZSBwYXRj
aCBpcyB0YWtpbmcgbG9uZ2VyIHRoYW4NCj4gZXhwZWN0ZWQgYW5kIHdlIG1heSBub3QgYmUgYWJs
ZSB0byB1cGRhdGUgdGhlIHBhdGNoIGluIG5leHQgMiB3ZWVrcy4NCj4gSSBhbSByZWFkeSB0byBy
ZXNlcnZlIHRoZSBuZXh0IGZyZWUgSUQgbGF0ZXIuDQo+IA0KVGhhbmtzIGZvciB0aGUgcXVpY2sg
Y29uZmlybWF0aW9uLg0KSW4gdGhhdCBjYXNlIHZpcnRpby1tZWRpYSBjYW4gcGljayB0aGUgZmly
c3QgZnJlZSBpZC4NCldpbGwgY2hhbmdlIGFjY29yZGluZ2x5Lg0KDQo+IFRoYW5rcywNCj4gQWlz
d2FyeWENCg==
