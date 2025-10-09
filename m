Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13C7214A64
	for <virtio-comment@lists.linux.dev>; Thu,  9 Oct 2025 05:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759986737; cv=fail; b=O6Puza1z7beOqmFoyNUZIO5X+7Be7087ewwu/GlJ7MydpOlMnMHG1rbR8/grGCZLVbTpJYop4xmFkTptJSRQD/cAMmH2scsopUZmhT8atPvvCgKTnvqcbAuXo0mLw3qv8A/a1YPeomXxruWb8pvSQP8J66O55S2x+qvvrx7Rec8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759986737; c=relaxed/simple;
	bh=KQ3UTFJ2x/+dx0zfSoX4I+NUGDPpvM932ln73qE/dZo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pVujwaStgBE2IoBNg1+G3eKIZVKJuzEXGcMb9FneSB+TwgthN0RvCT9NTPwL92Xh8w/nlYmuiM7QM+hIuiO6p8t1FeantMtUwrEPmFuL66+DtpAbi7zJJd64oXVr2WK09c1J2RHq9AKk2dwD826gl91bmr+qHwhkYnaHciF+Qr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QnDmCpoJ; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QnDmCpoJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xd8NKh7sPPndEJcRgl0vyjGMp7M0MYqgi8pymgIiSdj5zTDdVsTVLEicMGTIWvJ7zp07838lJ2f1++DfXCVNPv1thngZK13x236tWxYMh13miNF/1fLNwKWwYx+O7z4CbaTnbo62PIyG4gLYtFH+AXxkYWgOI9lJbYb3hHG3OtwyiJsASJGcyowdRscgn0uizCOcZRNqCnAQrAtlKstEWbAXDijHNRvixHCrFAxJdsGoFtIIz5AviheXUE/V0X41toApmhKqdarXHmDz0LcOqCuYo+frJwD9Rvvo7NvM5SQ3YSQ1gu1fJlyYbsfjt2f49XZkqL80nYAG9pbEdssEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ3UTFJ2x/+dx0zfSoX4I+NUGDPpvM932ln73qE/dZo=;
 b=FX6FJMQVvLlro34TUu6T2ZfCQIroSKLFWlCRVhSSl+gJlv5jCvS5oQhK1rKltZ/kea/JST9MJT/BKnYaEkiLx1XDayEJnJ5KPt0yBnM8VceO3c38CTX11AB7lHo89juqtCG2C0LKHlyjRambQMGravtlPbHVfDzMtINTJwYKje+Q/icTgbSyJ+wuawbDgsfGfcBDqmq73PajgVjiEE2Bc4vZie32ziMpYWetxxKI1uDuCCJ896Yer7TWjnOq3RqrgDyDRT/USA27nCNQGhfLLF/csE9tmOAhsUJmZr56BFj05dBQdDGjYPJTNg5nPrhMjJ1Reu22AJh7urltzUkyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ3UTFJ2x/+dx0zfSoX4I+NUGDPpvM932ln73qE/dZo=;
 b=QnDmCpoJGWz81KoT/RvrLxBkvnrsQLwKKm3qn7xBF6ggtuSANumwGvlSHyMQXsGmypILljy5w+NalxCFO+b/epJdSQI1V2EsWDgBOfZBCdggdSTNBEhJ9y0fNXusD3LLEK6dNviGxEcJaBTtesxBBb3LrN0VWAtVdlcV0aBLBrSU//autUuRpPa3s0ANgLBCtHHCQ0/zHp/EeEf6dg5D3nwOc4ftXstivqbB9/lD1UbYQ1EJ2JH/BjJ7Wx2VHDqwEWffLxE4PJEHX5qKfvQpgDZssbxx8nPRnplCOp/Qn97XmNG+SegtEu6SWunEcLq0+JVLuu1mLhOQagbasj7HaQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB8646.namprd12.prod.outlook.com (2603:10b6:208:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Thu, 9 Oct
 2025 05:12:12 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 05:12:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH 8/9] Makefile: add some simple make automations
Thread-Topic: [PATCH 8/9] Makefile: add some simple make automations
Thread-Index: AQHcOGQwyqdiVMKjOEmC8RtIE5iqxbS5Rbbg
Date: Thu, 9 Oct 2025 05:12:12 +0000
Message-ID:
 <CY8PR12MB719559ED11EC467517D071D7DCEEA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251008145916.2626143-1-alex.bennee@linaro.org>
 <20251008145916.2626143-9-alex.bennee@linaro.org>
In-Reply-To: <20251008145916.2626143-9-alex.bennee@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB8646:EE_
x-ms-office365-filtering-correlation-id: 7073e2ab-c783-4505-fb64-08de06f267d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UVFFajFJRGcyNVhRWld3VitsYjdrMEt3bW9YQk1UaTMzNW53WXhHREhLVHBT?=
 =?utf-8?B?NnZtTmRpMytGQkhHWHBoeXpoNHQ1VDZyU2RSTng5VkhVSUFNVGd3UG4zckE0?=
 =?utf-8?B?RVRrVnBDME92N3ZDZlc4UCtyZGhhV29sVnpuWUJTRjIvR29BeGptREZ0WEc3?=
 =?utf-8?B?bHhHcVBTdWZRbnJKcEpoekE2SURDdXhmSG1hZnBpK3NGZmpnMERta3hQcFlX?=
 =?utf-8?B?cis0T3dVcFcxUFg1ZEtZWHF3Nmgxd0tiK3A4WlU1a2E2QlU0U1JtakZOYmU0?=
 =?utf-8?B?NE11MjdtRmtCSTlVdHJwWmYrYWQ1VnVIei9USEhJRGsxVjBQSHhHZzlvblFx?=
 =?utf-8?B?SVNQUmhSTnArVFpCVnB4Zi9Rd1FSZWdFUEVsdVJmbytCNU9HREdaMlhUUXRH?=
 =?utf-8?B?VkV4Mm82OU42NTRuWUdvOXRwOFpoc0ZtNHJ4dXdpcDlxQlowUE5lRlpaOUlO?=
 =?utf-8?B?cHpLZlhzSVdzWlhUN3hHZGlUbGw2cnV0N2U3MTFuNFUxT1dKdTQydmozdjY4?=
 =?utf-8?B?N0EvL3lvc1MyNnZ5RlFLbUFMc3NjaStFaGxqbUZTRWQ1ZVRma1JiTWZKSVZq?=
 =?utf-8?B?cytwZkVwNnIyeVdXY2JNdldtcW5hV1NGRmNSUVNCNVNGcmhhdkphZGFxTldk?=
 =?utf-8?B?eXpkbFR6UDFWcjdWZENEUE55cVVGN3h1cGpZeUhnb2I4VTVDMmFFdS9GS2JN?=
 =?utf-8?B?SnphNnpWNjZVb05TbVlQb21zYlVIVTRMRFNPTWdzUENTY0lyVXR0WWo2Y0VC?=
 =?utf-8?B?ZkpSaHIxWUdmeFZ1am12SlhYYUJzYnE2cEIyRWhtMTFaNEl0ZXo2TWlVWmJu?=
 =?utf-8?B?TnlWQkJSVDNNR1ZmM3l4Ni9ISEFCc05HMHRKRXY1YVJXdXRkSVNCWVAvWE5a?=
 =?utf-8?B?YkZPekFHY2huRlNnUkdVc0R1azFMVUZBNlkzUmJVY1Q5ek5qUGFNVmxtUTBC?=
 =?utf-8?B?Nk4xV3RqZnJLcmwzM0hGSEVOWE1lZVk3S1pnbGE3OGhxeXFOaFNxb00xN1J1?=
 =?utf-8?B?TDF4RGNNVUlvWlR0U1dScWNVT0FuSlNQVWUvWStuN3dyaVN2S2t4dHo5NVdJ?=
 =?utf-8?B?N3IwdGhBYkR6ZEREczJrRkF6ejlxTnNLVWhSZXpvV3BwVHBtZlQ0dG5sd3BP?=
 =?utf-8?B?MlZRcVhpd0xUUjNsY1YwNmxaRk1QbzAwY01DSlJpVVliUjF4RmlXSlNDZFBJ?=
 =?utf-8?B?S0xwdkdlSVZ1eU45Y0llbTRpUThFOG5YMmZvNVdNbldiWitOdkFtcmdSYmlI?=
 =?utf-8?B?Y0VrNjNtR2FYSVFrOGttZHFveE9WSlVWN2FnYlhnZUIyT1hvK29FVEZzWnBu?=
 =?utf-8?B?N09LWVcrN0tFNWVHcmo2R3d0Zk53eVhOVWI1OS9KZjAxR2RhRjd5dmpUR2Zr?=
 =?utf-8?B?b0ZkZCsyQ1pWNG1wZ1YrK3NxeTExTTQ5ZWJLUlVSVE9MNU5STWxmd3FxenJt?=
 =?utf-8?B?ZzQ5dEZ2V0xLWVpqRXJmY291U3FOSEVrS0hZNXhvYXdCK01Eb29SOHM5citY?=
 =?utf-8?B?QmZCcXR2cnlRcUI3RkZOUjFrT0MyNFk3ck5MQnZjSFpDbWJ6THFtcHdpb1JE?=
 =?utf-8?B?dXczVVlTaUtNb2RYZi9KNnlWeTU2K1RPN3l3ZVU3aDhnYS95OERXbzVWQ1k4?=
 =?utf-8?B?MW1oSUpRNG53V240RHFESzJRZ1UwUFlOWVNIQXdMTnovK1VFZDAxTVF3Z2JB?=
 =?utf-8?B?OFUzZjVwQVdzRFpuVjJzY05uTXlienhtZ3BnNzNMdzFKcU9CR1pnRDF5T3lx?=
 =?utf-8?B?RVREVmxLRG50SWpSZUFxS2FOUjZVZXZIaE9QL0hxM1ROOFJTSG1iTTYyM1Fh?=
 =?utf-8?B?eFZDN3htUzhhdFZRSE9VUm5nVzE1WXQwYk45dXBVM21MQWZ1RXBWZUQ4bUMv?=
 =?utf-8?B?bmpQc2tPSHczTHM4YjRpTmR5VENlZVJxL04rVC9jMXpZUnJPUDM1VG9OSG1q?=
 =?utf-8?B?clRuU3pkR2U5NFJIZndrQWN4NU5GZ2lYTVIwOG4xZlBGMStWWks5RHJ6b04y?=
 =?utf-8?B?dUZnaEwzLytRRzYzeTYwOExBbnJYOHJyRUNIMVUxN0k0NzFnTEIyQkF0VmE1?=
 =?utf-8?Q?CqkIah?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjNjNnRLZEprWCtMb3NHalFWOFRjOTRUOXd1UHVIaGx3Q2lYNGZFOFo3OVVZ?=
 =?utf-8?B?NHdoaDY0TFRQNFZ6Tnp5T1NNczNMUTRpeUdmRmFYdFdHNDNMeVUvcTFkUC9l?=
 =?utf-8?B?ZGd5aFpvZmhVQ0J2R2RqdFdVNWlCRnhQNzF6MW5rcDd4bWpWcFFKaHEreGto?=
 =?utf-8?B?M2x5VldWaklyeEZ6UW9IZ2xGck9pbkZsb2Y1NUV5OGhuMG52M2Z1V0p3WWVY?=
 =?utf-8?B?cU5yWnp3aFlhcGZkRzZPWmpxRWJzcE9QK0x2ZGgvMmJxN2FRS2JsbVVBYVNK?=
 =?utf-8?B?NGh0UDBTQ01weDJ0WWowYzNQN0hFdU5LM052VjRzaU9KNHp2emlmS3NYdTRx?=
 =?utf-8?B?NFhaU0x4S1lDQUZueUFTd2lDNFVvaWJNSEpGSUJ1bW1QM1l4Vkw2VW1zMzJL?=
 =?utf-8?B?L1RxWVI1UzZneXlXYktCekQ2ZzhBRTB2VWgvdzNZcHpPcFRNWElQcWU5ZmhH?=
 =?utf-8?B?eExWa2pNdi9STWdDL1Ywb1o5dFBsNW0ydlVOK0U4dDlRMjRFdndPZlFUZ2xM?=
 =?utf-8?B?Ym45b1RYV0swMnp4NFd3RVU0UUN5L3I5NW51UnB3Ly9YQzltTzhwTDRjQTN4?=
 =?utf-8?B?azBydHlxaUJ6dm1tZVRYY1BDWjViVmk0NitkTkRYNEhQcEZGM0JFLzhacGJv?=
 =?utf-8?B?ZWZRT1BtTDJEb1FxaDBpK25UaWFidmU1bXNKZGUwa25ZWWJNVUFjODZXRm9a?=
 =?utf-8?B?U0JGbmQvQTYrejB0QUJYKzMyY0FPTGJ5VE1XRDZINEtoRlp5ZHVCQS85d2hn?=
 =?utf-8?B?ZERGNEpYYW14SWVtUU9GL0h3MlBVcFVqMnArb2FEem1qMVVFK0JFS2pJUE5w?=
 =?utf-8?B?YkhzOUU0MU9LelVFWmZ0VVg0TDM0eSs0aDRVQk1NaEFkVC9KOU9xMExPK0dD?=
 =?utf-8?B?bU85Si9KclpYdGp6L0c3a282d3AvcjZTdlN2ZElrRmRhL3J0UXVkTmladk5Z?=
 =?utf-8?B?MzExb1B1R0dEZUIzS2hqcmZ3dkJMa0pWalhzaU9jbTdXWkFDb042ZEhxay9M?=
 =?utf-8?B?Ump6VWJNSHVtMVpuN0kwRjYwRUt0WmxTazNCM2ttSFhXd1NSUDhQWFhPRjFQ?=
 =?utf-8?B?L1dxQm5OYjlFckczNHpiRTdxejc0bGxLSncyUEc1bE1kTHZFZnAyR1hXOGRj?=
 =?utf-8?B?UzYyY0ZHZEw4MWFjL1dDWnpsaEdxKzRJaU5XUnZEdEg0Mm5PYVZtYnhNZGwy?=
 =?utf-8?B?ZDl6WXQzOU1jUi9tR1hsZ0JsT0VtZG10VGFmQlVZYVpGaTZvSW4zZGppUmV0?=
 =?utf-8?B?bUVUR3FpajBmb1ZyelkrWmhyeC9MaENvV2ZQMll4dDc5OG9XbGNOZ3QxUlVP?=
 =?utf-8?B?WnA4RFJGTlpWemFsVXJ2eWhkTGZFbFgrV2pWMW1pZHlhRG5OQTdwYU1PNkF0?=
 =?utf-8?B?U1BGUGphaWtMbW1rWFJsTFYySWd6bC91c3QyK2VOVlp1aGY4UnlzeGRncVRr?=
 =?utf-8?B?ejJQcno2SjA2cmdBRU5ENUtqdzVveThYYkZVM0IyWWZIMUltakY2MUc5UFBS?=
 =?utf-8?B?TXlYbVN5YXhpRzRxSW9icVV2WFFlenorQmdmVDYrUWlWUHlOa2dkNmJDNHJz?=
 =?utf-8?B?U1hKdGtkZkJjaXd5ZlpaNmw2YmlaaXFrOWNsak5DcXNpaDVCOC9ONGd4Nm9I?=
 =?utf-8?B?MTg2Wi9aekc2aUtrV2lYd2l3WlNwSGJKYUljdjBYczhkNmpWb2huazJ2eEh6?=
 =?utf-8?B?eTEycWgvRURYZUpXbXdLcHJBTGlBbnk0L0c1YmJ2dTR1ZGxGVlhnVFV4U0FU?=
 =?utf-8?B?bFlHNnFvd004ZlBvVi9mbzFUaXl3Tk9iL3BBRlQrRFRRMnZPV09ZQjE2ZzBO?=
 =?utf-8?B?b3J1T1NObWFIS21RdlVnYjYzbitCSEtpU3J5d3VYSDNIOFFFb2lqcjBvVmNn?=
 =?utf-8?B?N0NhRllPeHA4VzBFNEduTVg0NFo3cEtGbUQzLzJGcEg2a243WlFUZU5IQldm?=
 =?utf-8?B?RTRVdWNJYlAzTWI1c3IvQ3lseVZyQmdnanRKclY4YjNEYmxpT2dGOW5UOVE2?=
 =?utf-8?B?d0N2YkpBeGU4MldDRDhCOWFkMm5RM0h0NDkwWGQ4SENxRkUwbVp3Mzh0aUh5?=
 =?utf-8?B?dEhJZWZOL1lLaFljZXBYUE9HMnliRzN5R1BwNGhwQm1odVJUQzgxclBJaVFh?=
 =?utf-8?Q?UofM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7073e2ab-c783-4505-fb64-08de06f267d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 05:12:12.6851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MIEIht+MTIYlAALQrCBWdVMuNln5Fo19lZEPhYBkKFsJlkdrYmG7uYAjttVbC8HUOlRQ8aQW1NJ4uHJREHr8hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8646

DQoNCj4gRnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50
OiAwOCBPY3RvYmVyIDIwMjUgMDg6MjkgUE0NCj4gDQo+IFRoaXMgaXMganVzdCBhIGhlbHBmdWwg
c2hvcnRjdXQsIGVzcGVjaWFsbHkgd2hlbiBlZGl0aW5nIHRoZSBkb2N1bWVudHMgd2l0aGluDQo+
IGFuIElERSB3aGljaCB3aWxsIG9mZmVyIHVwIG1ha2UgdGFyZ2V0cyB0byBidWlsZCB0aGUgZG9j
dW1lbnRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPg0KPiAtLS0NCj4gIE1ha2VmaWxlIHwgMzMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IE1ha2VmaWxlDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9N
YWtlZmlsZQ0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi45ODliNDI5
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvTWFrZWZpbGUNCj4gQEAgLTAsMCArMSwzMyBAQA0K
PiArIyAtKi0gTW9kZTogbWFrZWZpbGUgLSotDQo+ICsjDQo+ICsjIEJhc2ljIE1ha2VmaWxlIHRv
IGFpZCBhdXRvbWF0aW9uIG9mIGRvY3VtZW50IGJ1aWxkaW5nICMNCj4gKw0KPiArLlBIT05ZOiBh
bGwgbG9jYWwNCj4gK2FsbDoNCj4gKwkuL21ha2VhbGwuc2gNCj4gKw0KPiArbG9jYWwtYWxsOg0K
PiArCS4vbWFrZWFsbC5zaCBsb2NhbA0KPiArDQo+ICsuUEhPTlk6IGh0bWwgbG9jYWwtaHRtbA0K
PiArDQo+ICtodG1sOg0KPiArCS4vbWFrZWh0bWwuc2gNCj4gKw0KPiArbG9jYWwtaHRtbDoNCj4g
KwkuL21ha2VodG1sLnNoIGxvY2FsDQo+ICsNCj4gKy5QSE9OWTogY2xlYW4NCj4gK2NsZWFuOg0K
PiArCWdpdCBjbGVhbiAtZmQNCj4gKw0KPiArLlBIT05ZOiBoZWxwDQo+ICtoZWxwOg0KPiArCUBl
Y2hvICJCdWlsZCB0aGUgVklSVElPIHNwZWNpZmljYXRpb24gZG9jdW1lbnRzLiINCj4gKwlAZWNo
byAiIg0KPiArCUBlY2hvICJQb3NzaWJsZSBvcGVyYXRpb25zIGFyZToiDQo+ICsJQGVjaG8NCj4g
KwlAZWNobyAiICQoTUFLRSkgICAgICAgICBCdWlsZCBldmVyeXRoaW5nIg0KPiArCUBlY2hvICIg
JChNQUtFKSBodG1sICAgIEJ1aWxkIGxvY2FsIGh0bWwiDQo+ICsJQGVjaG8gIiAkKE1BS0UpIGNs
ZWFuICAgUmVtb3ZlIGFsbCBpbnRlcm1lZGlhdGUgZmlsZXMiDQo+IC0tDQo+IDIuNDcuMw0KPiAN
Cg0KUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCg==
