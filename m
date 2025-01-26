Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150117E
	for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737872654; cv=fail; b=gZYdQdKWZbyCo7QCaF4uBQ2PIBDQNUg4ejjg16ZnaLSvNEOWyImJjfm/N9XIUZUzC7/vL1kWPDhvz9TafMBJ31U/svm8Vrk8Y9qr09r5jjLvCZEziGo4krrOzX1G+NxkuP7jSiXrvbz3fpSTMZb9eG5R4awMjz/dfPOJFSK/FwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737872654; c=relaxed/simple;
	bh=4QOaN1/3xv5KKWpsUcMKeww9jhg6WnSyg0T8gPis6a8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CpMXAOU1WKEkay4cJxNUVkLU2xsxiprF5OvClRdAtXrJ90+naNc+M++nG2SOc5v04cQtH8K81ftg2cXLCcxdQX4Dl5jNYm/5FMBSRugozrLJfiRtEDKF+vgqGIBzmHHKZwGDSQN0X3ESKSurCc56GQkFH+wAR7Z3+2IFmXIh25g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XO7kXwbR; arc=fail smtp.client-ip=40.107.94.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XO7kXwbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fzjg3Ww1v4lSgD9Ols8GaQxZQRRmLpo6n3tjhX2cExbj9m9LgLyrmbYPd06widzXKFTkDdz/t8W3u6VB14hO33+Ijdr1MEXAyBlO9gVs3LV481j6rX9iC/pbm8DXXDG64rZCFbWGzJZh68BErf3Qeelrew0/VZQ3qpdALEJScut/oIGNJ1NUilxHbLhgZAzDFP4UhwWPQ71NOmGksclJU5pV7B7aWk7k+zq0g48zd1/dtXAAmxjIGwpQTVdEBvGxdPMWLFwEDy1BDcgu8RRJzOULP4264hUjuKrI0aKw4VjhiXeqIWxPw0aHWK8Wk9Q21Pj38lZzrm63Depj7wCcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QOaN1/3xv5KKWpsUcMKeww9jhg6WnSyg0T8gPis6a8=;
 b=pO8/Di8Ah+bUz4aqrYEO8UebPOjxiCh53q/MdA5gqsPk7s+37/yUVpXsdQma04bOb+dg1Sp8cu+xc9JJybnVrqXGGIjBOezGLXv74aQ0EMgSEr1wSNmx9u86JI+bFqeJK+oY82BPxWNXJ/TI0yj/8vEgMBXsQd2jTbBc3twSwmvjjgOjRTVSkdD5eETTAjRmNsqifi6FC2Yy8iqsrKxjgT2ri0tGY+VjTLGhuzsV0n+Bj2SfIKqolC3+ExEGxMnt3n7Pz078U6zuB1ImP6/7vcLFbz4SU19QIvByVrLu7Gn79Lo8KgyWXkFaVz7KjJ2AeccJ4z+SfnmMbU1trqZGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QOaN1/3xv5KKWpsUcMKeww9jhg6WnSyg0T8gPis6a8=;
 b=XO7kXwbRZsox4ugrCGqnDld87tv2uOh0kIh5w2Uoa3DQ9F90p3N/zB8telgQ7r70cPzcP3i5cbJik0FyGvVLS/n7cn5pvRskmTj4BGW9xFWsTU6UtcOjN32o9YSca91gKOf8MccyhA0jOS/6WLcyfNeNxVVHijNyd7qazADuMkeyxNYghiPKtjiz6SQ/0YR6/Uf/En3D/jDKP+Xi6mGSuHPA9axVLRhXx8BBQnS190fBUUal0RgDXDBJH0RV43w60fPJ3gEocBsLS2MPQmB6GWfE8qZ29eEQFnE9U05YRX+yfoVIh9nfFSxAS34WRZ2uEl1mo113ctxLVcr20GM4nA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW4PR12MB7286.namprd12.prod.outlook.com (2603:10b6:303:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sun, 26 Jan
 2025 06:24:09 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Sun, 26 Jan 2025
 06:24:09 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Topic: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Index:
 AQHbQK/3KR1RJyc06Uq86qDUg7CIZbMeDhsAgAGk7ACAACgGwIAADtUAgAAhHvCAAdtqAIAHDbrg
Date: Sun, 26 Jan 2025 06:24:09 +0000
Message-ID:
 <CY8PR12MB719581AB9B4BB1250AB731E7DCED2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ikq98yod.fsf@redhat.com>
 <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
 <2d27f420-d155-4aad-9626-8b42acc0cc22@redhat.com>
In-Reply-To: <2d27f420-d155-4aad-9626-8b42acc0cc22@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW4PR12MB7286:EE_
x-ms-office365-filtering-correlation-id: 7f950af7-9eaf-435f-b0b2-08dd3dd20af7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTd4NndvakV4cG1CaUFtK1ovSFNaOWNlZEhLaTZjVll6SUIvdmI3VGdhWVlk?=
 =?utf-8?B?MC83SGRtYWtZbTMxUXRGZkhBbmVTNkRNcnhFOUVSaTBTNStQbkhzbjlieDNO?=
 =?utf-8?B?MTQvLzQweEc3UnBzL1BCMy9ReXJiK2F5NndkSGVycjRRaE5pT0d3TFJxblFx?=
 =?utf-8?B?VjFNSUwyREJTaU9RY3VPWFE3bVJSQkl6V0g0eFYxaGNrMEpzSlBwaVBnNWZF?=
 =?utf-8?B?TjgxV3lRMDduWDhhTE5yYW1XQ3BMSC92d3R0RXU2OXM4TjJGeW0wZGJ4Y1RS?=
 =?utf-8?B?SldpTVVSN20zMk1acjlkc0xRU04vTVhNVU9TNWlMRC95ajJVaWJOcExsMDNn?=
 =?utf-8?B?aUFpQjJjRkFDeElYU1R0bzhLcDNUczlBaDNkKzFmbHpqVE5FaUNKS0Q3cEJ5?=
 =?utf-8?B?VzdkT1lrTzBlSnlCajFudzZncTdxTnN3SDNGK0hsMTZhMlJyS1NZZTMvNmcz?=
 =?utf-8?B?SCtPUzNNZG5Ka1NOb2x2Z3NDVkE3MGwvSTZ3Nm1ra29ObkJwaHlrd2h2NXVq?=
 =?utf-8?B?VWxTbi9UV1grZXZMNFdZMVNmaWpUR3J2UjBUQ1d4S2dTU1FmTlArOVBhbEJX?=
 =?utf-8?B?cVpMbDZndjNRdEEvUmNwVXRJR3M1aU9zdzZuMlVsSDdSK2NjYlU2SG1WN01K?=
 =?utf-8?B?OW9ibEt5VkdkUTZBODlXSGZXaTdzL0xMM3Nxa2w3TEZtc2UreXlnRTNOZTNO?=
 =?utf-8?B?UHVwcmNLZ29IcTFLVWRWNWN1a3VEdGpYd1pJZXl6ei8vbFZ2VHZIZnpENVQ2?=
 =?utf-8?B?Q2UybytDdkg2V1RGZ1NhWEppNFBLUHE1TmdabkRRTkNUblhIQ2RsY0g3b1d4?=
 =?utf-8?B?MlBPZnZXOHdWRjIxMzJpVGljVFZxQ21RU0M4T01wNUd6VUFsVk1yekQyY1dp?=
 =?utf-8?B?R1JINldPd2xEMmY0UFplZGNVSkxDYndPblhMa21nZGJkMEU4cGtnMUdsaTJz?=
 =?utf-8?B?elRYVzE5VUhqeE55Tlk5eDh1a2dIeVNKU3NnL2pnWFNvUkZ0MjVWT3dhQS9T?=
 =?utf-8?B?VkZpV0dXZW9wTSs3Y0Nkek1sQjJkOVVYeEV3bWVCdmVqeld6bjNGaGU3TkxD?=
 =?utf-8?B?d2g5c2JjK1JMRDFkN251TmRBSGVIeEFtS21TNXJnd3NpTDB4d1NWZmNtUnhO?=
 =?utf-8?B?NWtHa2xuSU9NUFYyVkhaSFBtTHVCNmF2NHVQaS9yL3VIcUdqdUZFZS9zVTVr?=
 =?utf-8?B?RnF0T0lMU3VGTFI4SzJhREZtdFpTMzBDVjhqNGVOOGNIUmIyNHBISjVEUzBa?=
 =?utf-8?B?VFhIbko4eUxlR2d6QnNGOCszdEdKSUFRN2FxU3FmOU5jK2pxOEQ1TjFUUUFL?=
 =?utf-8?B?ZnVRVlJtZ1BoYkNyM0haczQ2SGJQMkJWWmxueHQ3UHd3U1IxMHVnaytzRFc0?=
 =?utf-8?B?NStuc1FTcW1mUWhlRjl4NEQ4TTRvQ0xxT2o3elFtd0tPRm9rMzJKa3hmYy82?=
 =?utf-8?B?c1V2bVF5M2d4QkxGRzF0VGhBSEpHeWx3cHdFaWpKY0pRbjEyeFUvWUFPVE9U?=
 =?utf-8?B?c1RlKzlVNFFhbGVYT3N0MjRINjZZU2xGUjZwU0p4YWJHaWZUZXorVjBaWEp0?=
 =?utf-8?B?QUZDSStncGY0VWI0TFVxQ2ZISkhETEVRcG10d2d1aTVxQkhJa3p2bVd6SGNm?=
 =?utf-8?B?VUhvRisyVUpLSXFVaEJUWS8vQjhSVG95YnpGdWIvTGFhb3R3cXNvOFZGVGh5?=
 =?utf-8?B?dkpjTXlBUG9qS2cwYnNPY0tKUlhicDlQcndHMXhIQTRzUlFJVWRNMnZhWmhY?=
 =?utf-8?B?MEVVbmJDSVZNN2ZuSTFqNjlGRVhwUHpHb3VUZGUwaVVHSFJGOUZURjd2ZStz?=
 =?utf-8?B?cHB5T3VuZVQ3M2E4MnBmYUZ3enRSWU9DMitHWlkvVkxGVmdEbXZTdXZDRzJl?=
 =?utf-8?Q?eWS/QNIwmZ/Di?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGFIVXlVUG9mWUt1SGNhV1BKdHJ6VGZIVjlYOWxJRlpjZkpWK2o0QThMZVlp?=
 =?utf-8?B?WGRlc2dRdkFsVEpwYVFrcXIxekRGTVVIM0ROd25WWDFUZEVBdTEvbzNiY3Q0?=
 =?utf-8?B?SHJlMkpWSDEwblZJbEloY21iOG5HeVpvRDdVSTRJcHNoUi9MUmdaNmF0UUlj?=
 =?utf-8?B?YTViQWhuakpUUkd0Ri9BSzJ6YWRqcEFpMlhjb3ZNcC9heXlsM3ZrRVlJTHp1?=
 =?utf-8?B?ejArL3R6WUVqa0xlUUIxekRaUUpDNmZVN3g4R3lHOXJMOENlc0hQazZrencr?=
 =?utf-8?B?NlNGZHp1RWdLaFc3dFc4NkhvdGFLQUQ4TVN1MlVsZGliVE52VDFkcnowQnF0?=
 =?utf-8?B?cTNsRWpxb0hTZCsxMG5iQXd6R1dDdHNOc3J3elBVZHg0TWd6WUJMbFRhd3Nm?=
 =?utf-8?B?WkhQZGxxUldxZXhXamhwbVZMMjVPbGMvbDJUTjVScDlpSDAyM3c1cm5YZTVk?=
 =?utf-8?B?WUZMaTBDNmI0WGdTZU9EQjFMdDZhWVZ4Wmo2ckhFWEl0ZmxFOE0zeW5xL3I2?=
 =?utf-8?B?Vzl3NEo3M2ZyeW84NGNBTDhwZmZIOU9pc20xNGlYdDVYNkFSNCtuWGFFbzlM?=
 =?utf-8?B?VGJjQXZBVVJ6UTVxb2FSemJIUnUzWWFuak9IZ1QwMER2UGRFd0FXRmgxcWFs?=
 =?utf-8?B?THZOWExleVhSVElUaVJrZHdPMk5udkI0RFlnb1R6eFB6Yi8zUkNJbFgxUzBz?=
 =?utf-8?B?a1ZJeGdNTHk0VGZ5QVNNRy95emVROCt3OGZBSmdUZ1lnWnV6cStKb0RWWDBK?=
 =?utf-8?B?NllXcjhGZ1dvVzNoT1lWWXFnN0ZjNGhiZ3IxQm0wN21qSkRNV1lpVFpHVWNC?=
 =?utf-8?B?YkRQbWkyWEdBZU05YTZGOWlDREZyWnRsVHZOZkYxZnFzcnJRRUNzeDRZc0JU?=
 =?utf-8?B?VUg1WGluNmt1RVlySllKdFdzczRRcTlRNDJFZzFRMENzcldzRzhKbVZTNFpN?=
 =?utf-8?B?VStmc3NaUVFVRHF1Y21LdXpNYVhZOEZvandZdU9Obnk2VGtpSDBSSmVSUlpL?=
 =?utf-8?B?Uk5FeFNJeit3NjVBNjU0ejdwOGEvMTNVYzI5MFRmam91QVJoRTk5NnZGVFBE?=
 =?utf-8?B?RG9tMGRIQmdOU3JsY2U3TDl5OHJic3RUdEx1czdrRUhkLzJSVGZ2b3hBbXh1?=
 =?utf-8?B?QkRQZnZpMUhQa1BwWVhtZy9wYUFvMHBHZTNlR3RnQS9PUlc3S1RUZXlkMWlL?=
 =?utf-8?B?L0pLVEhKR0o5M0U0dXcyYVFOQndkcHNVMVVIdVN4TW0rTlY4NWl0Y2kzOHVG?=
 =?utf-8?B?VFdRVjNrVTZhMGVSakRUYTZYeDc1bzhwd3dFWWNncG9yNWFHa1hyU3lwUnVi?=
 =?utf-8?B?RllRM1FUbEJiR1Z2d3BBK25iVkVBb3B3QlN3bFZDNVJNbUFLSEhSVVNNdHdl?=
 =?utf-8?B?alMxZWM1QmFvaUR4d3I3WFhCZnhJak54WlNoVWllNzRqMUhiRWRRU3RnMnRX?=
 =?utf-8?B?a3F0REdZQVBhM3MremYveDdQUGpIWmtoZXlQSk01ZTlOYVN1RmE0QzhkVWtD?=
 =?utf-8?B?akFzdG4rMFZ1VlA3RHBlNm1kSUlDdkdGRTB3RWZsYzFuY25WUVhPdi9YZlZ2?=
 =?utf-8?B?VTZZSzJJSk45d25ISHZIU0VKSElLTHAzdU1JSVRURXBTanV0Z21lQzhHSDg0?=
 =?utf-8?B?VFRXSFhscXI0K1dKSzF6QzFpUjJpS2NZcXNaV1ZGWHhQU01va1FhMTFrWW82?=
 =?utf-8?B?VytsR0NnNXVKUEtEbncvcXFKdVNVdm52T0xQVSt2SUs4VXd4NkVPYTBZc0NU?=
 =?utf-8?B?QzhKK1lNTDRLWncxbTRkL09aY2w4WE5XUGZPbjZ4bDdtU1NhSEZ5Wk0zdEZY?=
 =?utf-8?B?R0dIY3luUFRGQ1JvNmExTkRESHZRMDBpNXNDdkY0RlZVR0xqK2krRE9tRFhX?=
 =?utf-8?B?bzdQSWxySFB1NEV6aUQ3UWlWTWxwTUl5UnpUVytGbDBDdmJ0QUtheHZhRG94?=
 =?utf-8?B?VG1IWlU5S0k1MDRaTzcrVU81SEl5RWs0elVBZC9KbEFUZEF2dFFUUkU0UjJ3?=
 =?utf-8?B?K3o2azU2KytVcGs2Z2xOUDdaVkQ4cnlXVmFnMXFvK0NNblVSbUx4MEVDcmdN?=
 =?utf-8?B?Z2pOSHpKaGhHby91NXA3WEFhL01xODB6ODZzMlhTZklXdmV6MW5xNi9NaitR?=
 =?utf-8?Q?3P88=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f950af7-9eaf-435f-b0b2-08dd3dd20af7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 06:24:09.2567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5Ce/j7axBJJ5PyvYAsr304LmvoMEO2YmY5itUyfgkxVCMdKO3DSgC9IYscjQzr4dhGwOknpuPsPhWLuY0JTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7286

DQo+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBKYW51YXJ5IDIyLCAyMDI1IDEyOjEwIEFNDQo+IA0KPiBPbiAxLzIwLzI1IDM6MTkgUE0s
IFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+PiBGcm9tOiBDb3JuZWxpYSBIdWNrIDxjb2h1
Y2tAcmVkaGF0LmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDI1IDU6NTAg
UE0NCj4gPj4NCj4gPj4gT24gTW9uLCBKYW4gMjAgMjAyNSwgUGFyYXYgUGFuZGl0IDxwYXJhdkBu
dmlkaWEuY29tPiB3cm90ZToNCj4gPj4NCj4gPj4+PiBGcm9tOiBDb3JuZWxpYSBIdWNrIDxjb2h1
Y2tAcmVkaGF0LmNvbT4NCj4gPj4+PiBTZW50OiBNb25kYXksIEphbnVhcnkgMjAsIDIwMjUgMjoz
NCBQTQ0KPiA+Pj4+DQo+ID4+Pj4gT24gU3VuLCBKYW4gMTkgMjAyNSwgUGFyYXYgUGFuZGl0IDxw
YXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+PiBIaSBQYW9sbywgTWljaGFl
bCwNCj4gPj4+Pj4NCj4gPj4+Pj4+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNv
bT4NCj4gPj4+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjcsIDIwMjQgMzowNyBQTQ0K
PiA+Pj4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiArXGl0ZW1bVklSVElPX05FVF9GX0dVRVNUX1VE
UF9UVU5ORUxfR1NPICg0NildIERyaXZlciBjYW4NCj4gPj4gcmVjZWl2ZQ0KPiA+Pj4+Pj4gR1NP
DQo+ID4+Pj4+PiArcGFja2V0cw0KPiA+Pj4+Pj4gKyAgY2FycmllZCBieSBhIFVEUCB0dW5uZWwu
DQo+ID4+Pj4+PiArDQo+ID4+Pj4+PiArXGl0ZW1bVklSVElPX05FVF9GX0hPU1RfVURQX1RVTk5F
TF9HU08gKDQ4KV0gRGV2aWNlIGNhbg0KPiA+PiByZWNlaXZlDQo+ID4+Pj4+PiBHU08NCj4gPj4+
Pj4+ICtwYWNrZXRzDQo+ID4+Pj4+PiArICBjYXJyaWVkIGJ5IGEgVURQIHR1bm5lbC4NCj4gPj4+
Pj4NCj4gPj4+Pj4gRmVhdHVyZSBiaXRzIDQyIHRvIDQ5IGFyZSBub3QgYXBwbGljYWJsZSB0byBk
ZXZpY2Ugc3BlY2lmaWMgdHlwZS4NCj4gPj4+Pj4gVGhleSBhcmUNCj4gPj4+PiByZXNlcnZlZC4N
Cj4gPj4+Pj4gUGxlYXNlIHNlZSB0aGUgbm90ZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQ3VycmVudCBz
cGVjIGRlc2NyaXB0aW9uIGlzOg0KPiA+Pj4+Pg0KPiA+Pj4+PiAwIHRvIDIzLCBhbmQgNTAgdG8g
MTI3IEZlYXR1cmUgYml0cyBmb3IgdGhlIHNwZWNpZmljIGRldmljZSB0eXBlDQo+ID4+Pj4+IDI0
IHRvIDQxIEZlYXR1cmUgYml0cyByZXNlcnZlZCBmb3IgZXh0ZW5zaW9ucyB0byB0aGUgcXVldWUg
YW5kDQo+ID4+Pj4+IGZlYXR1cmUgbmVnb3RpYXRpb24gbWVjaGFuaXNtcywgc2VlIDYNCj4gPj4+
Pj4gNDIgdG8gNDksIGFuZCAxMjggYW5kIGFib3ZlIEZlYXR1cmUgYml0cyByZXNlcnZlZCBmb3Ig
ZnV0dXJlDQo+IGV4dGVuc2lvbnMuDQo+ID4+Pj4+DQo+ID4+Pj4+IFNvIDIgYml0cyBvZiB0aGVz
ZSBwYXRjaCBhbmQgb2YgcGF0Y2ggNCwgNDYgdG8gNDkgdG8gYmUgc2hpZnRlZCB0bw0KPiA+Pj4+
PiBiaXRzIDY1IHRvDQo+ID4+Pj4gNjguDQo+ID4+Pj4+DQo+ID4+Pj4+IE9yIGFuIGFsdGVybmF0
aXZlIHdvdWxkIGJlIHRvIGFtZW5kLA0KPiA+Pj4+Pg0KPiA+Pj4+PiBCaXRzIDQ2IHRvIDEyNyBm
b3Igc3BlY2lmaWMgZGV2aWNlIHR5cGUsIEFuZCA0MiB0byA0NSBhbmQgMTI4DQo+ID4+Pj4+IHJl
c2VydmVkIGZvciBmdXR1cmUgZXh0ZW5zaW9ucy4NCj4gPj4+Pj4NCj4gPj4+Pj4gTWljaGFlbCwN
Cj4gPj4+Pj4gUGxlYXNlIGxldCBtZSBrbm93IHNvIHRoYXQgSSBjYW4gaGF2ZSB0aGUgZm9sbG93
IHVwIHBhdGNoIHRvIHRoaXMNCj4gPj4+Pj4gb25lIGFzDQo+ID4+Pj4gdm90aW5nIGlzIHN0YXJ0
ZWQuDQo+ID4+Pj4+IEFuZCB0aGUgZml4IGlzIHJlcXVpcmVkIGZvciBpdC4NCj4gPj4+Pj4NCj4g
Pj4+Pj4gSXMgdGhlcmUgYW55IGhpc3RvcmljIHJlYXNvbiBmb3IgNDItNDkgYXMgcmVzZXJ2ZWQs
IG9yIGl0IGNhbiBiZQ0KPiA+Pj4+PiB1c2VkIGFzDQo+ID4+Pj4gcHJvcG9zZWQgaW4gdGhpcyBw
YXRjaD8NCj4gPj4+Pj4gSWYgaXQgd2FzIG9ubHkga2VwdCBhcyBlbGFzdGljIGJ1ZmZlciBmb3Ig
ZGV2aWNlIGdlbmVyaWMsIGFuZA0KPiA+Pj4+PiBkZXZpY2UgdHlwZSB0bw0KPiA+Pj4+IGdyb3cg
aXQgaXMgcHJvYmFibHkgb2suDQo+ID4+Pj4+IFVzaW5nIDQ2IHRvIDQ5IGhhcyBzbWFsbCBhZHZh
bnRhZ2UgdG8gcmV1c2UgaW4gdGhlIG9mZmxvYWRzIGJpdCBhcw0KPiBiZWxvdy4NCj4gPj4+Pj4g
UGxlYXNlIGNvbmZpcm0uDQo+ID4+Pj4NCj4gPj4+PiBTZWUgdGhlIHJlYXNvbmluZyBnaXZlbiBp
biA4ODg5NWY1NmU2NDIgKCJSZXNlcnZlIG1vcmUgZmVhdHVyZSBiaXRzDQo+ID4+Pj4gZm9yIGRl
dmljZSB0eXBlIHVzYWdlIikgLS0gdGhlIGlkZWEgd2FzIHRvIHB1c2ggb3V0IHRoZSBwb2ludCBp
bg0KPiA+Pj4+IHRpbWUgd2hlbiBnZW5lcmljIGZlYXR1cmUgYml0cyB3aWxsIGhhdmUgdG8gYmUg
aW4gdGhlIGJpdCBhcmVhIGJleW9uZA0KPiA2My4NCj4gPj4+PiBHaXZlbiB0aGF0IHdlIG9ubHkg
dXNlZCBvbmUgb2YgdGhvc2UgZ2VuZXJpYyBiaXRzIGluIHRoZSBtZWFudGltZSwNCj4gPj4+PiBJ
IGFzc3VtZSBpdCB3aWxsIHN0aWxsIGJlIHNvbWUgdGltZSBiZWZvcmUgd2UgcnVuIG91dCBvZiBi
aXRzLCBldmVuDQo+ID4+Pj4gaWYgd2UgbGV0IHRoZSBuZXQgZHJpdmVyIGdyYWIgc29tZSBiaXRz
IHRoZXJlLiBTdGlsbCwgSSdkIHByb2JhYmx5DQo+ID4+Pj4gcHJlZmVyIHRoYXQgdGhlDQo+ID4+
IG5ldCBkZXZpY2UgdXNlZCBkaWZmZXJlbnQgYml0cy4NCj4gPj4+PiBbQW5kIGlzc3VlcyBsaWtl
IHRoaXMgYXJlIGVhc3kgdG8gbWlzcyBkdXJpbmcgcmV2aWV3DQo+ID4+Pj4gdW5mb3J0dW5hdGVs
eS5dDQo+ID4+Pj4NCj4gPj4+IEkgbWFkZSBhc3N1bXB0aW9uIHRoYXQgb25lIHdvdWxkIGhhdmUg
cGlja2VkIHRoZSBkZXZpY2Ugc3BlY2lmaWMgcmFnZS4NCj4gPj4+IEkgbWlzc2VkIHRvIGRldGVj
dCB0aGlzIGVhcmx5IGVub3VnaCwgbXkgYmFkLiA6KA0KPiA+Pj4NCj4gPj4+IEdpdmVuIHRoYXQg
d2UgYXJlIG9ubHkgbGVmdCB3aXRoIDQgYml0cyBpbiByYW5nZSA0MiB0byA0NSwgYXQNCj4gPj4+
IGdlbmVyaWMgbGV2ZWwsIGl0DQo+ID4+IHNlZW1zIHdpc2UgZm9yIGRldmljZS10eXBlIHRvIGNv
bnN1bWUgZmVhdHVyZSBiaXRzIGluIGl0cyBkZWZpbmVkIHJhbmdlLg0KPiA+Pj4gRm9yIHZpcnRp
by1uZXQsIGJpdHMgNjUgYW5kIGhpZ2hlciBhcmUgcHJlZmVycmVkLg0KPiA+Pj4NCj4gPj4+PiBI
b3dldmVyLCBpZiB0aGUgZGV2aWNlIHdhcyB0byB1c2UgZGlmZmVyZW50IGJpdHMsIHRoZSBjbGVh
bg0KPiA+Pj4+IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHdpdGhkcmF3LCByZXNwaW4sIGFuZCByZXZv
dGUuIElmIHdlIG9ubHkNCj4gPj4+PiBjaGFuZ2VkIHRoZSByZXNlcnZlZCByYW5nZXMsIHdlJ2Qg
YmUgZmluZSB3aXRoIGEgY2hhbmdlIG9uIHRvcCwgc28NCj4gPj4+PiB0aGF0IHdvdWxkIGJlIGxl
c3MgaGFzc2xlIGluIHRoZSBzaG9ydCB0ZWFtLiBJZiB3ZSBkZWNpZGUgdGhhdCB3ZQ0KPiA+Pj4+
IGNhbiBsaXZlIHdpdGggdGhlIHNtYWxsZXIgZmVhdHVyZSBiaXQgc3BhY2UgYmVsb3cgNjMsIEkn
ZCBiZSBmaW5lIHdpdGgNCj4gdGhhdCBzb2x1dGlvbi4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEkg
YW0gZmluZSBlaXRoZXIgd2F5IHRvIG1lcmdlIHRoaXMgYW5kIGZpeCBpbW1lZGlhdGVseSBmb3Ig
dXNpbmcNCj4gPj4+IGJpdHMgNjUgYW5kDQo+ID4+IGhpZ2hlci4NCj4gPj4+IE15IHByZWZlcmVu
Y2UgaXMgdG8gdXNlIGJpdHMgNjUgYW5kIGhpZ2hlci4NCj4gPj4+DQo+ID4+PiBPciBhcyB5b3Ug
c3VnZ2VzdGVkIHRvIHJlc3BpbiBhbmQgcmV2b3RlIHJpZ2h0IGF3YXkgdG8gZm9yd2FyZCB3aXRo
IGJpdA0KPiA2NS4NCj4gPj4+DQo+ID4+PiBQbGVhc2UgbGV0IG1lIGtub3cuDQo+ID4+DQo+ID4+
IFBlcnNvbmFsbHksIEknZCBwcmVmZXIgdG8gaGFuZGxlIHRoaXMgaW4gYW4gImF0b21pYyIgbWFu
bmVyLCBpLmUuDQo+ID4+IG1ha2luZyBzdXJlIHRoYXQgbm8gdmVyc2lvbiBldmVyIGhhcyB0aGUg
d3JvbmcgYml0IG51bWJlcnMuLi4gbWF5YmUNCj4gPj4gaWYgeW91IGRpZCBhIGZpeHVwIHBhdGNo
IHRoYXQgY2hhbmdlcyB0aGUgbnVtYmVycywgYW5kIGNvbW1pdCB0aGVzZQ0KPiA+PiBwYXRjaGVz
ICsgdGhlIGZpeHVwIGFsbCBhdCBvbmNlPyBMZXNzIGNodXJuIHRoYW4gZG9pbmcgdGhlIHJlc3Bp
biBhbmQNCj4gcmV2b3RlIGRhbmNlLg0KPiA+Pg0KPiA+IEhlcmUgaXQgaXMuDQo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLWNvbW1lbnQvMjAyNTAxMjAxNDEwNTIuODc3MzU1LTEt
DQo+IHBhcmF2QG4NCj4gPiB2aWRpYS5jb20vVC8jdQ0KPiA+DQo+ID4gRG8gd2UgbmVlZCB0byBv
cGVuIGEgbmV3IHZvdGluZyByZXF1ZXN0IGZvciBpdD8geWVzPw0KPiANCj4gSSdtIHNvcnJ5IGZv
ciB0aGUgbGF0ZW5jeS4NCj4gDQo+IFBsZWFzZSBiZSBhd2FyZSB0aGF0IFZJUlRJT19ORVRfRl9H
VUVTVF9VRFBfVFVOTkVMX0dTTyBhbmQNCj4gVklSVElPX05FVF9GX0dVRVNUX1VEUF9UVU5ORUxf
R1NPX0NTVU0gdmFsdWVzIGFyZSByZXBvcnRlZCBhIDJuZA0KPiB0aW1lIGluIHRoZSAiT2ZmbG9h
ZHMgU3RhdGUgQ29uZmlndXJhdGlvbiIgcGFyYWdyYXBoLiBJIGd1ZXNzIGV2ZW4gc3VjaCBjaHVu
aw0KPiB3aWxsIG5lZWQgcGF0Y2hpbmcuDQo+IA0KT2ZmbG9hZHMgc3RhdGUgaXMgb25seSA2NC1i
aXQgaW4gc2l6ZS4NClNvIEkga2VwdCBpdCBhcyBpcyB0byByZXVzZSB0aGUgcmVzZXJ2ZWQgZmVh
dHVyZSBiaXRzIHJhbmdlLg0KVGhpcyB3YXkgdGhlcmUgd29udCBiZSBhbnkgY29uZmxpY3QuDQoN
ClBvc3RlZCB0aGUgdjEgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLWNvbW1lbnQvMjAy
NTAxMjYwNjIwNTguMTM2OTUtMS1wYXJhdkBudmlkaWEuY29tL1QvI3UNCg==
