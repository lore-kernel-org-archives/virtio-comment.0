Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD541F180C
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723519; cv=fail; b=jGHiVM5Oji7rzA4L44bTHq6v0POyIqzxj9fHNa+z53beCoYuujLQXs6PNS4JIDS+yDA+8gKZjugTV1pRLJBMSONL47ZZe0h3tQ6DoHKJrnZbsd5A4TW1XGyJmgBdO/q3iHtLzb4wlDjWH42iJjZ5h5lLYvfFkGoDdDCWs8SZIuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723519; c=relaxed/simple;
	bh=krxaeQ4F9/TmcoWaiwvEQhaPYwWkO7ZoLgTYBxV8rpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YzrBB5DAY46Hlj04asiaCh4P6krNXl3KP7qJqj1KXzHHtAPFa2ZQPUddNhFYX0I7DreoepPevMlZ0J3+MzcrD7V0ZDUQMYFPyWssQSnEvyxFId60DVLTdkWsUCiESUECtgwWwsEzXRTi+cwavVY3PF94c/KGTCmOoYnkgPPeW24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WomuoJT8; arc=fail smtp.client-ip=40.107.237.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WomuoJT8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2cxTKaINoV4ffwHCNs36xe6dI6F7xnxGyMlGLRLNY19RAG1BjwIBDACQmiiHmQFoGMhhPJVTgmG1qPDLM0pjde4zDu3etfxoP/9xfNemcmpn12C511cfMxz67VN3JvntIQKGMcGjd4SZv2xTt1fAg0J5f+37g2+msnuK6K1/l2G3wN9GCIiTKCmtbaG8bODSf49axJVwmEQzLf3u1e2yGZp5rbHsehuIo6hlXKgb/tSZplnJ+ZIvJGQKXTVoVAWpw13IIcSbHQMwa0jOeXwW/m2ITUCskS+UDAR0unWI2iVuygWlEyWr6JYRnNPSm5ka+MdG+Rt1RuvME58u6zpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krxaeQ4F9/TmcoWaiwvEQhaPYwWkO7ZoLgTYBxV8rpg=;
 b=kcWoj+cTILbSv5fhFRR+0Pr0zwT/UkaEMGdJi3McM208IrvjyLR0mtC03bME7y0NX59JrxpPb/+ppizHN/GYaJWpc7aJakV6sOmMEAM9nFpMjxUsIV/rr5U9pdOhGnjDtUNY9geabpGm6N4EbvoJ0Kiw+vspT9fWsV4AI2FQfBb1Qgr8gPqHQYvzMs+KiBAM4IEMrzkdfbk6gQe1Gb65PaxsblGPnGd/D+Rj8FD79QVGNO9jL+dT3NATxQq0hQqX9GOZsyTMgAzX/cknCno2z94VH+GcJpZKq4MXHiQ4RFax+NfTuL/4zbcAvN0Et3K1cILaB6g1DK77yy6sp+mG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krxaeQ4F9/TmcoWaiwvEQhaPYwWkO7ZoLgTYBxV8rpg=;
 b=WomuoJT8aflL7Qcv/eZDR4c9Lzm++lDWas8FjQWu8NDs6nJFUY7sU1oFZ9BVppQryKDw80kSLxClAUQH8EiDzxKHu4ZsfSjB7xCnJqgEy6vbtiI+mGqbPfHogAXF4ixULogP/AxGLMTafm+eA+Pmb+zmqpMkdEm371qpgpYK6w7z4r9W49g/84++wEyLLPWuejw/WgUlGrhSZgeE9ulBtNyVBnLGaCOcAqwgHk+FNVMwcMZazzVm2usIuCdAR42QWdOYH1YFrdSQqH+A1pJ7Y/VEv/BR+29PGCMuajHEVGRQoP2f3X4auVFL6xosMqVSuPhJKB/lhecg2FEBAgGRgg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 06:45:13 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%4]) with mapi id 15.20.8699.026; Tue, 20 May 2025
 06:45:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"mst@redhat.com" <mst@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH] virtio-net: clarify guest offloads <> features mapping
Thread-Topic: [PATCH] virtio-net: clarify guest offloads <> features mapping
Thread-Index: AQHbyKaO+bVcJjxnXk6sUs+adTcgY7PaDEwggAEHnYCAAAAywA==
Date: Tue, 20 May 2025 06:45:12 +0000
Message-ID:
 <CY8PR12MB7195A1C9610E8DB145910AC6DC9FA@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
 <CY8PR12MB719579675CB3864AB3A7218EDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <94d39a71-8610-40d9-bb68-531ed154ff88@redhat.com>
In-Reply-To: <94d39a71-8610-40d9-bb68-531ed154ff88@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SA3PR12MB9198:EE_
x-ms-office365-filtering-correlation-id: 5cd46af1-971c-4901-51ed-08dd9769df36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlY5SE1SOWFtVUZneEdvaER6UWNEVjVlNDFPRzA4aTVURXhpY2JXc2NxNU9X?=
 =?utf-8?B?K2UwMVFLYnBteit4VFFJVGNLTmhWVDBodUJDaXAyU3BBUjNtNFA4LzgwTTJq?=
 =?utf-8?B?UTFhc1RmT05DYkdrVDIybkNKbUdEanp3L1ZTL0lZNS8vOFZ2ektYbXFXUmQ1?=
 =?utf-8?B?dnhqY1h2TlhNNkhySStsSHlDSUl2Mml5aUYxVzN3ZzZvOVhtZEZSS3htbnkv?=
 =?utf-8?B?K0U1MXladk1RaW1OY2RrK2tNWnV3aVFRaHphc1JTT3lHSjNncE0zQVBqZjJZ?=
 =?utf-8?B?b3B4T3VTZkNROXVueWNHRnoyb0tHVE9SY0xQaTVHQmZ3NVd0MnlkQmVhOGRh?=
 =?utf-8?B?dTY1dHNobzJEeFgyRlNKdmdEMzJza2hXQ1hIbmt3cU1ONTZpSWx0SHBneG9t?=
 =?utf-8?B?Wnp3RVFPQkg5ZWlEdkJtSEFEVUtpL29hMSs1dHZHTnVSdkErSjhnZk82dnht?=
 =?utf-8?B?ZktWcWtrZ2JNTloyYkpZbS9WNnVlZnFzNHZNVWROSW5CRUVJdU9HYUZDVDhj?=
 =?utf-8?B?eDc5MVRYZ3hRYytWMTRuajN6VG5jdHBYbDNUK3RoNnhhZjZjc0ZzcHlCQk56?=
 =?utf-8?B?eUh5dy9pRDgyUWpLZlVXeng4ZG01Y0gwVll1eWZJTENtRzRFT0wxdG9Id0hy?=
 =?utf-8?B?TE15emdkTXNhSGdnR0NMa3E3bFBLZjRnUFVIQWkrTURlYUFrUmYrNEppcFJl?=
 =?utf-8?B?VUpTbzQvVVNUdWdtMlZmdTROY3hCTlQ2OFZaRnlmK05tc0dudzlqWFVkN04z?=
 =?utf-8?B?cGJheTlsdHQ1SGRDQURDVEFJRGpHbWdQcVpzZ3JqbW5Gc3ZlbFdqR1pTZ1dv?=
 =?utf-8?B?SktzMFZnOEE3V0daWDM4OFlrQi8rSXUwLzZKQUJiUnRabS9LYmtzdHFtUEdI?=
 =?utf-8?B?cW55Q3MvTXkvcnorU1FyUmlhRzlyaDQ5LzRoUFNkMnIzTWhrZ0xmMEl5NWhi?=
 =?utf-8?B?L2ZJdUoyakovS1dUbkxuTWJNV0FDaUJxNG11TDVMSnMrci93UGZUaVRrUHYr?=
 =?utf-8?B?VWdIZHRlQnlZeHNTUUZXbmVWMmQ1M1g3alA5ZEErNHdKYVlzcDlSNHc5T05x?=
 =?utf-8?B?NUJYakpCY0NMN0p1dHBudmdaVVpldnFpVHRXK3ZNWU9YU0d0WXhMeTA0eWpj?=
 =?utf-8?B?M1JoUnA5Q292djg0eHFTVWxFWkVOOFR5czJ6MTlQcUlwL1VGSDNhNkQzQW93?=
 =?utf-8?B?RVJMdUxyNXdTbUllQzNvYjBoOHpObFIrMm1DeWFLYVRnc2pyNWZTZlFVU1Rn?=
 =?utf-8?B?NGxHTFRXTVliMmdQSysybVJsYnczaTI0OHhPNjhVSWlyUk9aYkdranpBRXBu?=
 =?utf-8?B?N0Uwdnc1Qk1VbFJreDFMaUUvb1U4Vnp1UDRtYURYSGxkNTJLQk01dWtPdWNV?=
 =?utf-8?B?WHluaXYrbE9sb2FVbzFBdmV2ZXlUTUJsWSt3aHRRV003OEVLM0MwN1NGWWEv?=
 =?utf-8?B?WStDTHpqTTJaUWUzQWxhby91WU1LSVRMdEs2S210c0liOUZoQ0Y1ck54a2hD?=
 =?utf-8?B?cmxkdlB3L1VqdXVJbXhoSk5ZbE5sb0ZpOUFIc2E5WHRDZkVlS3g5V2RRQ0VP?=
 =?utf-8?B?UjYzVFNiVFVQV0J2OTJZRXIzYXNKTFg2RXkwNml6WE93VmZJSlpsVkJWVklC?=
 =?utf-8?B?R2xlWnhuWlloQ21rQldINUpwdFRnbFpOdEpaRVRyNWxicGRyVDBreTBZR1dU?=
 =?utf-8?B?SXhrdU4vbEFqdnNERWthL0xoVkRLbWhoOHVmT3FuM1phc1ROczd0ZWdzd2Fz?=
 =?utf-8?B?QnZMNHJPeTdmTGI1bXVyVmFWTXZoajFWU2FCcWZZWmxxU2tlVk1BZEhmbFEx?=
 =?utf-8?B?ejJsZ1AwWDlvdGI3N1VheW9OTDZrMkVWMDdMSUNuNytBSTBtcHdYN29tdDIw?=
 =?utf-8?B?Y0Y5QjN0TXJ0V25DcC9wN2RxeFNhRFJSZUxuOUxwUTJQektxcXNYKzdONW16?=
 =?utf-8?B?RWVYcnBCa24zTkdhQzc1anl0NEwxNGRvMEJxWEpSNUVvd0ZpZU9OWkpVYUdD?=
 =?utf-8?B?bTZWT3ZaYzJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW9weEtxRCtoSEg1TVRabUhwL2hYUENJTFBnMlBsdzF3NTAyRnZGTTlFOUxO?=
 =?utf-8?B?aVY1OFBBRm9NeU8zYkhISWNqekh1Y0l4RHphTmNaUk1NcERSU2tuaWdwU3Q1?=
 =?utf-8?B?UFpBVE84NnJhSndtaHJnc1VGVkRhNHI3a05aK1dnL3VrelMzR0VWTEhGcGxQ?=
 =?utf-8?B?K1VpVmpqdUtMY2g1QjVsTGdiSVREK1FoNWQ5TCtkWUxtYnJ2YTN3ZXhSYzV3?=
 =?utf-8?B?YUlBaDNyeDdoeE1neTQ3ZXRRYlpVYU1RcmJpTEVJMlBBRXRyUlZ5OWwzLy9T?=
 =?utf-8?B?V3BqcHVUZERPeVFsUVJmeU9RaHdMVDBEbTNlR0cyaFVVMzNLdlpGeVg0QzRR?=
 =?utf-8?B?T0s0ekZ0NCtrcFVlMlo2UWJ2dlRwTmlMbTB6dGFCVXBYTzVLTzlqL3ZkWit2?=
 =?utf-8?B?SDNrK2hlcnNnT1RnS2paYXZIeFByeFNJSHdEV0I0c0FXTVpYWFJHSFpsWXNJ?=
 =?utf-8?B?R1Rjb3BsczdFSlplM0NXMzBtditoQThEL1BLYUxHZmNSa05xRFdRNGJoNHg3?=
 =?utf-8?B?cWMyZjQ1RXZZeUpMWFVQb1hha1JhWkdtUEFYMjBIOGxVS2VMaVl4K0srWnM4?=
 =?utf-8?B?RmVMVTcrd0Y3SWsxaVNlTDRBUk4veWlHOUhxOFNlc2l4QzFWUDFnNmxWVDFQ?=
 =?utf-8?B?eWFQVnhxUjFUUHM3WGt4M1dkZzV0dW9uWmF1K2U4bzdtQTFLOHhUQ3RxTUVX?=
 =?utf-8?B?MzdsellFVzJHb1dVdWlYUjZCU2xDY3labTM2K01yYUNsc3plQjdYUXhVcnhk?=
 =?utf-8?B?eVpjRWp0T3F6aGgyZTlIZlBlNjh4a2F3YlB1OTF1dU9xOFArL0JrT2FTSGhG?=
 =?utf-8?B?TFNlclZKNzVwVEs2Yzlld2VFaWRPYlc0T0RhaU9lRlRXM3FiY1Z2K3U4cUNR?=
 =?utf-8?B?N1cwMHZ0dkpEZmpENUdieFJhc092ZXhtSXFvSGtrKzRqR1E3bi8yQmZTb1lj?=
 =?utf-8?B?ODY4TEprTVYvT1BUWHVnc0c1Zit3RlhITUlSbjhJSmxKOFRuVDhudGRwdjhP?=
 =?utf-8?B?YlRyU3VoWVZPQ3FhZTdRbDQ4QlI3L2dzYk1oYWZNUWFmQmJiZ2NibTF6K0Fm?=
 =?utf-8?B?SHVUcm9zRnZlc1M3azNkV05nbVFkalZiaTJFNVIxbzljVXQ3S0t1SjJIQmtj?=
 =?utf-8?B?NFBWTEJPYk1ueUtDYlVxSlFzS21mL2NuVDRCdlphbmZuQndKNTAzWWFLTXJM?=
 =?utf-8?B?dWYyaVNGdllCa2p0NTFRVVgvazJ1SnZkYjJVMG11L2YwSUN5SXFUam9IczI3?=
 =?utf-8?B?THBlOEVGSzZUTnpiTGFJZFBGb3RNbFl1YndPa2s3WGhYSk1rOTdvV212M3Zq?=
 =?utf-8?B?dE1aMmpJQVlTZ2Y5bjd5Z0M1ekhvMmp4R0tEZU90YS81bkt5ak1BKzJLT09i?=
 =?utf-8?B?OUF5Y2gvcnRSMmFjZmx2RGtJMmVzVjZIVCtvL21wYTZEaS9CWVFZVmlVY2Yz?=
 =?utf-8?B?TUlVd01VMHFlanVlM1lsRERvY3ZhRmtYT3NWOHF4WlRGV09QTDhSYVllQkt5?=
 =?utf-8?B?SU1UYW9WOUFJMEJueWRuNEJnd3VaMUR6V3EwR0NvVU1la0FkTFprcUl5MThz?=
 =?utf-8?B?N1kwQ3ZEOXNrbzdkaW5nV2NJM3dUSExIcm1kai9wRkQ5TXZaMkpJeGJoaVlS?=
 =?utf-8?B?QWkxeDE4UloxUVg3TWc2ZmF2VmZJYWliSTgvY3NpWExjWEx5dzd5QVBzWG16?=
 =?utf-8?B?QTRKNXk2ZmVoU2pyRlJjSjBoTDd4MFFadHYvdFZ1WWJhQ3JoVXk2cTV5T1p1?=
 =?utf-8?B?Nk13V3BRZjBTWG94c29WKzcySzJVSWpiRlVlRktSdzh5QjNZa2JHa2tVUWhD?=
 =?utf-8?B?SjFVZlc1c3F1VG9JeThYOEptSkJyejdUYlhZRWpGK1JSdlBhOVpBR2JoT3lN?=
 =?utf-8?B?TitrSmU4THF6THBTell1N2VQRDdFVWJFNDVkRnZRNXVmdjhITVFoaEl6M0l2?=
 =?utf-8?B?VUpPNXMvdjFBYnh5V2FGY1R3bVNwSGFmcjBlWGxpRHpVdmc3M29JanB6RmJM?=
 =?utf-8?B?LzNhT09UVGp0N0tUNGVQY2pTL0QyYU8wZncwcjJsNTRCRzBVOFNHbUhMQk01?=
 =?utf-8?B?Vzl3VDhVaTVMQnlMYks1UWpJZ0RFVlZsY1JWRndTZ2hmM3N0ME5nMjJXWWpt?=
 =?utf-8?Q?VTdM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd46af1-971c-4901-51ed-08dd9769df36
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 06:45:12.8106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oj/C9bKDaiaCkkp3V853wG+/rxDH0E40zy1WQYvJmovvShcIVb78iJ36aiz1e1S6/v7Unrsi6HthMj5jMWhtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

DQo+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgTWF5IDIwLCAyMDI1IDEyOjE0IFBNDQo+IA0KPiBPbiA1LzE5LzI1IDU6MTIgUE0sIFBhcmF2
IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29t
Pg0KPiA+PiBTZW50OiBNb25kYXksIE1heSAxOSwgMjAyNSAzOjQyIFBNDQo+ID4+DQo+ID4+IFRo
ZSBndWVzdCBvZmZsb2FkcywgYXMgc3BlY2lmaWVkIGJ5ICdTZXR0aW5nIE9mZmxvYWRzIFN0YXRl
LCcgdXNlIGENCj4gPj4gNjQtYml0IHdpZGUgc3BhY2UsIHdoaWxlIHNvbWUgb2YgdGhlIGNvcnJl
c3BvbmRpbmcgdmlydGlvIG5ldA0KPiA+PiBmZWF0dXJlcyBhcmUgaW4gdGhlIHVwcGVyIDY0IGJp
dHMgb2YgYSAxMjgtYml0IHdpZGUgc3BhY2UuDQo+ID4+DQo+ID4+IENsYXJpZnkgdGhlIHJlbGV2
YW50IG1hcHBpbmcgYXMgc29tZXdoYXQgaW1wbGllZCBieSB0aGUgY3VycmVudCB0ZXh0Lg0KPiA+
PiBBbHNvIHJlbmFtZSB0aGUgb2ZmbG9hZCBkZWZpbml0aW9ucyB0byBhdm9pZCByZWZlcnJpbmcg
dG8gZGlmZmVyZW50DQo+ID4+IG51bWVyaWMgdmFsdWVzIHdpdGggdGhlIHNhbWUgbmFtZSBpbiB0
aGUgZmVhdHVyZXMgdGFibGUgYW5kIGluIHRoZSBvZmZsb2FkDQo+IHRhYmxlLg0KPiA+Pg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+ID4+IC0t
LQ0KPiA+PiAgZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXggfCA3ICsrKysrLS0NCj4g
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+
DQo+ID4+IGRpZmYgLS1naXQgYS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCBiL2Rl
dmljZS0NCj4gPj4gdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCBpbmRleCAxYjZiNTRkLi44YzUw
MWJjIDEwMDY0NA0KPiA+PiAtLS0gYS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0K
PiA+PiArKysgYi9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0KPiA+PiBAQCAtMjE4
Niw4ICsyMTg2LDggQEAgXHN1YnN1YnNlY3Rpb257Q29udHJvbA0KPiA+PiBWaXJ0cXVldWV9XGxh
YmVse3NlYzpEZXZpY2UgVHlwZXMgLyBOZXR3b3JrIERldmljZSAvIERldmkNCj4gPj4gICNkZWZp
bmUgVklSVElPX05FVF9GX0dVRVNUX1RTTzYgICAgICAgOA0KPiA+PiAgI2RlZmluZSBWSVJUSU9f
TkVUX0ZfR1VFU1RfRUNOICAgICAgICA5DQo+ID4+ICAjZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVT
VF9VRk8gICAgICAgIDEwDQo+ID4+IC0jZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVTVF9VRFBfVFVO
TkVMX0dTTyAgNDYgLSNkZWZpbmUNCj4gPj4gVklSVElPX05FVF9GX0dVRVNUX1VEUF9UVU5ORUxf
R1NPX0NTVU0gNDcNCj4gPj4gKyNkZWZpbmUgVklSVElPX05FVF9GX0dVRVNUX1VEUF9UVU5ORUxf
R1NPX01BUFBFRCAgNDYgI2RlZmluZQ0KPiA+PiArVklSVElPX05FVF9GX0dVRVNUX1VEUF9UVU5O
RUxfR1NPX0NTVU1fTUFQUEVEIDQ3DQo+ID4gU2luY2UgdGhlIG9mZmxvYWQgY29tbWFuZCBpcyBk
ZWZpbmVkIG9ubHkgZm9yIHRoZSByeCBzaWRlLCBpbiB0aGUgYmVsb3cgJ05vdGUnDQo+IHNob3Vs
ZCBpdCBiZSBvbmx5IDY1LTY2IG1hcCB0byA0Ni00Nz8NCj4gDQo+IEZpbmUgYnkgbWUuIEknbGwg
d2FpdCBhIGJpdCBiZWZvcmUgc2VuZGluZyBhIHYyIHRvIGNvbmNsdWRlIHRoZSBvbmdvaW5nDQo+
IGRpc2N1c3Npb24gd2l0aCBKYXNvbi4NCj4gDQpPay4gdGhhbmtzLg0K
