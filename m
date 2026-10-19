Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6D3E0758
	for <virtio-comment@lists.linux.dev>; Mon, 19 Oct 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402717; cv=fail; b=lfoq3drDVjN6Nuh1Y4I+k9J0HSUTMpXvsSse8znR5Z7nRtjJRoK/cIuMXZlSyOjiOmdmcjKahVqICj31/8bWetxpBmasgDmKyg6pY7rNvWWWeH8GZqb5CoPD7EU8Bpg7WVDgaME3ACuxHePfScyxqxs8y9erfRrRWLhPsz1te7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402717; c=relaxed/simple;
	bh=yvwoG4ioweKbYsoAZTotaD5yYWyvNRa8sKP8TifTFGI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hYAFRmxRs+HSzHy86hxVKFg8PZvA48UNUQ5YDNhpUgcnFZyKgJyrbkfcQSaat6tbGfwG5oUaqaKjHhr6MHp5VcfSDezijozg5U79+ms/Nehc2iST0UzQoTOF8OelRltW93djkgYQI4kwluCbm3/nMLCzercLbOYUub5T2fvvpco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RkKgGfV7; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RkKgGfV7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rv7a2rWrr3QjrRlkh5ROsPtb4Xa+3Afx6X0xtZ1fA3AZRV+lmNj9Jx/EtcHdCHbOKEEbWK3En0p6yjEj4hmTnX5O17+KG/eB7XlLCUqC6gx50YRZu474ni8n+JQDxdrkpG1fS6wWgF1gG2oKK6ejeSEWxEo8zZ88udlPeeezEcaVeNU5KFHzy/1/YwF9+9GpDE3NvF0rJzGBQJVEbdC7wcpHQ37l0YtcagwmRVdP6ufT6U1ToSJ5sopijvi3RG4etoo9K74g4W+Sxzw3dXmSjhHYKW4CcbBp1K4Er2xPE31DAW80ol3vakJZRweyN6hMTZiTdwH4mIcAZp8X2qZeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvwoG4ioweKbYsoAZTotaD5yYWyvNRa8sKP8TifTFGI=;
 b=DiyWtUbENFmMXun7lP27DuwrwUxl1KEgq7i0ag/x0/6sqmDyR2kFR4jzJePZYRhbVVMN5FViC534S3DP3g63ZYMEs+KtenCZlC3h+tnu4xVcfj4mOp2PQ8zOq9RzSMXFV9voyQspytxj70UH6DI8FCIqlh5oq4vKEJMxGQkdkIxwH8k252m/nAcyIIO0jKJw+XtZ6IM8eGosba/Ud3ecKY/R9diACzhvy+nJ3O+W6Oybo7A2VaPlPAslxQL/G1AdLZAHIrYgavo4nYQrpVuo1RRvnqYTmt1sJHz2A0D6myD7kSLovOnetXs/zSwXWpMEQd5th1V4Gm8rPFQnKv4urA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvwoG4ioweKbYsoAZTotaD5yYWyvNRa8sKP8TifTFGI=;
 b=RkKgGfV7ujYwwQ0QscmKTQQzbi4FijLwoxzfV9usjTjp37+JJCdCa6l3880nbRo8FPqk6Izjo7gXLwh5EWL9d+X8CCJU0HI/blk2GjGyVCtFPdPgjkkjJp0y10HdUT15q+oOlX38UqNuA67lhydUBCdBuC2ng3s10bBZ0nZwghGoEO3oafc4VbRFNz/cP/CMyuvKblYsLZ5+XsAO5XmLKFKSImEeQr5sVgtORKHmBFEVEtNnMN4hncbIxrzdlvtjp+Bof/YDuOxOyO/wBdFBj6AP97MlMWK/PaLJXXki6O1ff5kCwrKRpy5rFCcyOHDW4lEADox9F+hNsTpgyVv1TA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 09:38:30 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:38:29 +0000
From: Parav Pandit <parav@nvidia.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment
	<virtio-comment@lists.linux.dev>
CC: Stefan Hajnoczi <stefanha@redhat.com>, "ebiggers@kernel.org"
	<ebiggers@kernel.org>, "neeraj.soni@oss.qualcomm.com"
	<neeraj.soni@oss.qualcomm.com>
Subject: RE: [PATCH v3 0/2] virtio-blk: Add inline encryption support
Thread-Topic: [PATCH v3 0/2] virtio-blk: Add inline encryption support
Thread-Index:
 AQHdWp8h+w9D4Gdj+EO+ya5EUIel1Lb7qRyAgACzgBCAAEpkAIAAArDwgAAQJICAAAHAgIAAAZ4AgAHcFoCAAABGYIAGC3gAgAAAK9A=
Date: Mon, 19 Oct 2026 09:38:29 +0000
Message-ID:
 <SJ0PR12MB68061A89B8F469394F8609EADC982@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <de535820-591b-40f2-b840-d987c3253765@nvidia.com>
 <9515779b-a6da-407f-99f2-011e51683d15@oss.qualcomm.com>
 <20261008060644-mutt-send-email-mst@kernel.org>
 <d503aee0-9920-4c0b-b9a0-c08e505cc3ea@nvidia.com>
 <426abc9a-c7b4-4631-a5fe-3b2bba1d0414@oss.qualcomm.com>
 <SJ0PR12MB68060279EA2241FAEB2EDE8CDC9D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261014032222-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E08103C7BC39C61EADF9DC9D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261014035225-mutt-send-email-mst@kernel.org>
 <13419c56-ef94-4dfd-ba44-a3dffe5f73f2@nvidia.com>
 <20261014044718-mutt-send-email-mst@kernel.org>
 <0829d340-6085-45a8-8c0e-99c9d77b9625@oss.qualcomm.com>
 <SJ0PR12MB6806E6C827BD828065A847B9DC9C2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <05ffe40c-2971-4782-b178-2be688f5e785@oss.qualcomm.com>
In-Reply-To: <05ffe40c-2971-4782-b178-2be688f5e785@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|CY8PR12MB7516:EE_
x-ms-office365-filtering-correlation-id: 97e77383-3d73-4292-04fb-08df2dc4bbe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|23010399003|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 kyTyO2tbbPmkiGDYCqpCcImhj7+u+AkWRk9YI4NRYgyaAcmhfYvu8gQJeEYpRi7WJaIpG/ndiUeeRVKif8eCjAfw0bTiaXEeG3ueLb9cC1GITEwG/hOWEZTivH/xmKLsrP4qQC6+XNWoU14viKbfFj0ranb4A/4IFeoCJEVx3u1ZhDbtsaX34pWbD6VDGCBsEdBkIofSo5Ih3PVHnBraG0Qi3RpMLczNQrz4ZHvOwn5rkQcLdSUiZwNpeuPaFiVzll4f3xC75f7RouwLdxFw+HChixgltpeizb4MpqdjdmBeBdiTK9X1P75CnPTfer+2oXj25AdlQ4Xqtgut/Q6U03PGgcdJtRm5QtTi3kCrfPDuQ24xW7X+7je7rZssOFaxq3sBYeSsbP3Ov+GhohivEoMGdIV72YbAEuHt2HiuW9sOENrwPyuzNERafx07iuAd65F/TJGppVDXgNmC7iX/7wcgj4kVm5h5QyeYILq147j8n/sCfen8oyGm3mFEEp0oz0/UabZrhGlFh553E57vhIN3/kt6JzN1izVWfVUJciZPPjCfFQDzmW7ImL2zJ9SM2WJSakxbcUcdF8SALH54zFWpUCZiInQbFxtpE0bKx0BBIO+XqRrzLrh7gKqD/5xrc05d3WZYQujT92WEX8CQbKs4DptUFeMNChXZlDf10blmVdxIyUPNCnb2BHOc9aBHdXtJgwsREtdYMEOwXNnV2fcYwbvMXPnDr2YYJhUytHU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clo5eEFMNm9YVFU5VFRobGlpdUg0VXhmVS8yOVRwQnVLemhNSG9PaE91cjdn?=
 =?utf-8?B?VlJoOGwyWEZnMU5RWmp4a05xRGJya3haTzkxMXBKSUxJcExXQzlyYVk1TVdR?=
 =?utf-8?B?Y2lRWUhTRlZHZnJLV0luR2pNczY4Y3NGNWc3K1I5ME5qemdxTnVGNEtHTk02?=
 =?utf-8?B?S2hzMjZ2N2RxTmRSNzYxblB6c0ZwK05lckc2K3IwKzRQeC84Tng2VUo4WXdS?=
 =?utf-8?B?dTA2QkJGaS9sZDBqa0xwNUtQQU9lWlBqRnlMQ0JBUGgxVU45QTBPWDJXMS9J?=
 =?utf-8?B?c0RGWnZjS1ExV0EyaERLVVhGcXJQaG1xYXRGSXh0ZTdQRitHYi9vWUpuaUUw?=
 =?utf-8?B?RWcwN3N0eVQyc3BKTGlJV0lGZUNMdXlHYXd2Y2lJVmZEK0NQZzZEclZPUlNV?=
 =?utf-8?B?ZlBHdHRlc2dQSWdsTWphQ0dsVFpTWXpvR01TKzYrVzl6dWQ4elM5ZFBVZmVa?=
 =?utf-8?B?aVBSWDNwaHF2aHl0VHNQMlBGU2JtMHVtQ0JIUFZrV1RtWUpqc0VYUFFNdThr?=
 =?utf-8?B?eDF6T3RnaFhRN3ZPeENIejBSZVFRaHVibFozUkNMY0F5Y29jTFI0Zk1WckhY?=
 =?utf-8?B?My9EMHhEZ095SGJJYk4yUDJuZnUxbm83Z3pGa1EvQmhqS0k0MUw1a21tRkVp?=
 =?utf-8?B?dDhRb2UybWIwY3BCWVFnTVhpWk4vM3k2ZzFHSVFnWUpMOTZwZEJuQU1va3FY?=
 =?utf-8?B?WWFIbGVEOUF4TGdyRWxzQWxzMjV5c29pUWpQd2QzVFhKRFovSlRFSS9LUjN6?=
 =?utf-8?B?U3pWS3c1ck5EQm5GR0V1Rm5lN0FTREtWa04ySXFDc2tNNzN5THVZcEhYYXhj?=
 =?utf-8?B?dU1FS0I5aSs5TnFyeVA0Uys3MUl2Z1RmQ3JJbTZ4cldxaUQvYzc0TjdPSFh4?=
 =?utf-8?B?bysvY0Q0YVBuVHh6NGlIMmV0YlJ1UlF3K0RiQ29lZk1VakdJNlJmS0tySk5F?=
 =?utf-8?B?SjR5YTArOEdaaGNzaXdqOG1Xb252b1c1YXhzWVV2cEdyK0JCd2hkMTJmMnBN?=
 =?utf-8?B?VndkbEkvNEgxVU84cVlub0VxT0p2VHMwcTFYd0FBYm9sUHlMU3dHTGcrUGpl?=
 =?utf-8?B?Ty9LR2k5NC9UMlowdkRPWlJ2Y0NFNEVFcWpQMndLUWprdTl0aWF5UTNtWUtJ?=
 =?utf-8?B?OGoxWXRHMmJodXNvRmRaU3ZiNlZYZE5GOTFRdlMzSkFUT1hRNURqR3g2ZTdw?=
 =?utf-8?B?MmQzczdqTnJJbzZmQks5WElzQ3Bvb2dGdmlIVWJFUy9sa096dUVZTkxJdFBZ?=
 =?utf-8?B?WnNtMjNxT1hWaGZlT1pMVmwyV29vTEVlRkJ5V3NyNjJ5L3d0QVNlUzNPM2VZ?=
 =?utf-8?B?RzYrUTJUNzFJZkFqTjc2RGNFbXVZSGpIR1BQeXM5T2NxZC9tZjJET1gvOXVD?=
 =?utf-8?B?TzNIT0pCZmtMVlJLd0xkZ1YzajU2eVc5dTB6Mlo1QTNJVldNRGhZZnBvVzNr?=
 =?utf-8?B?Q1JRbW5pZXhBc0hzdTFYVHhMRlZWT0JIZHIycjFXTy9MNkFTcXNydVNYbnFJ?=
 =?utf-8?B?K3F6WW1tajVLNk9BUE5yZCtjdi9VMVMwbDlYWW1wNkR3ZklpMFU4SDdSa3Vp?=
 =?utf-8?B?THVseWFpMDJnb3FCaGV6Rkk2cGhmSjRRNHlRNlJyb2VDMWpsR3RTQWRTK2RK?=
 =?utf-8?B?Nk1xQlBiUWlOSVdhb2ljOWdwTFkrbG9WSG5LYVdsTmlZb2U3OHo1RVBaQUhr?=
 =?utf-8?B?OVN2cWttVUJZc1lBYUpHeUFLNGlLdjBvbmxHYSs0Q2pkMnUydXcvUnI3ZjBR?=
 =?utf-8?B?ckdCREpvanNSbExpdS9lWEhlTG13bVovUHNvMldRYXBKWkhGVFgraytrcHp3?=
 =?utf-8?B?NnpxRVVmNVJnNHBBbmJWdUdZamJjLzh1azdZMVR0WEN5MklzV3gyeWpiY09r?=
 =?utf-8?B?cklXWGRIekV6VG9xcGttTDYyUnExQkVlWTZ0dGg4NTBjZE1WZ1lzanRXK0tI?=
 =?utf-8?B?WVNLL1hhQmswWG5RaDJuVG1GUHNxVFAvZXBzQkRXT1VJUHAxODNSK1ZjbU1E?=
 =?utf-8?B?VmZOWE5SSUEwcURPMkpQTVp6M0ptdlZzeit2VDVLcndPLzhKZUNBZzY0RDFV?=
 =?utf-8?B?UURidzFTYkVldWR4R0RNZ1MwYnY0KyszaW11cU05eCtsUEovWHVjeGZlUXNo?=
 =?utf-8?B?MlBNTDBFaFpUTkxpclQ4S2x6OWdibjlSQURlcmFybEhEOHBoRzlVTEM0aVhB?=
 =?utf-8?B?V25lY1dUSW1NWFljMnhrMW5SN0FCalJ2dHlOM21rWVl1eXBPaEpWclRtQjBW?=
 =?utf-8?B?aW5UejRIenJEbG16d0FUaXByM3dqb0pwY0I0UVpsS2hLakExbmxMOC9WeHps?=
 =?utf-8?B?MUt3dWhJOWlDZVlycit6OFlXSVdrdGZTcEFIcDR5Q2NQZHBNZFlreEIzblZl?=
 =?utf-8?Q?zjP9TfiNWQT5U4CKFsS7fLG3rEfRrEeco0He5?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e77383-3d73-4292-04fb-08df2dc4bbe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 09:38:29.8852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khvofplBOFC86agC/XdCUxuWQd8PgN+I2KvChdC0cP7OeJFbnINCTBKqhPk6jXjgeJJh97OeAQn8Klo33ikPQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516

DQo+IEZyb206IExpbmxpbiBaaGFuZyA8bGlubGluLnpoYW5nQG9zcy5xdWFsY29tbS5jb20+DQo+
IFNlbnQ6IDE5IE9jdG9iZXIgMjAyNiAwMzowNSBQTQ0KPiANCj4gT24gMTAvMTUvMjAyNiA5OjE4
IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4NCj4gPj4gRnJvbTogTGlubGluIFpoYW5nIDxs
aW5saW4uemhhbmdAb3NzLnF1YWxjb21tLmNvbT4NCj4gPj4gU2VudDogMTUgT2N0b2JlciAyMDI2
IDA2OjQ2IFBNDQo+ID4+DQo+ID4+ICsgdmlydGlvLWNvbW1lbnQgZm9yIHJlYWwuIChtaXNzZWQg
aW4gcHJldmlvdXMgZW1haWwpLg0KPiA+Pg0KPiA+PiBPbiAxMC8xNC8yMDI2IDQ6NTEgUE0sIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDEx
OjQ1OjQ5QU0gKzAzMDAsIE1heCBHdXJ0b3ZveSB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+IE9uIDE0
LzEwLzIwMjYgMTE6MzksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+Pj4gT24gV2Vk
LCBPY3QgMTQsIDIwMjYgYXQgMDc6NDQ6MTFBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0K
PiA+Pj4+Pj4+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+
Pj4+Pj4gU2VudDogMTQgT2N0b2JlciAyMDI2IDAxOjAyIFBNDQo+ID4+Pj4+Pj4gVG86IFBhcmF2
IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gPj4+Pj4+PiBDYzogTGlubGluIFpoYW5nIDxs
aW5saW4uemhhbmdAb3NzLnF1YWxjb21tLmNvbT47IE1heCBHdXJ0b3ZveSA8bWd1cnRvdm95QG52
aWRpYS5jb20+OyBTdGVmYW4gSGFqbm9jemkNCj4gPj4+Pj4+PiA8c3RlZmFuaGFAcmVkaGF0LmNv
bT47IGViaWdnZXJzQGtlcm5lbC5vcmc7IG5lZXJhai5zb25pQG9zcy5xdWFsY29tbS5jb20NCj4g
Pj4+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvMl0gdmlydGlvLWJsazogQWRkIGlubGlu
ZSBlbmNyeXB0aW9uIHN1cHBvcnQNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IE9uIFdlZCwgT2N0IDE0
LCAyMDI2IGF0IDAzOjEwOjU1QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+
Pj4gcmVtb3ZlZCB2aXJ0aW8tZGV2IG1haWxpbmcgbGlzdC4NCj4gPj4+Pj4+Pj4gQWRkZWQgdmly
dGlvLWNvbW1lbnQgbWFpbGluZyBsaXN0IHdoZXJlIHZpcnRpbyBzcGVjaWZpY2F0aW9uIGNoYW5n
ZXMgYXJlIGRpc2N1c3NlZCBieSBjb21tdW5pdHkuDQo+ID4+Pj4+Pj4gUmlnaHQuDQo+ID4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4+IFRoZXJlIGlzIGFsc28gYSB0cmFuc3BvcnQgY29uc2lkZXJhdGlvbjog
VklSVElPX0ZfQURNSU5fVlEgaXMgY3VycmVudGx5DQo+ID4+Pj4+Pj4+PiB1bmF2YWlsYWJsZSBm
b3IgdmlydGlvLW1taW8sIHdoaWxlIHRoZSBwcm9wb3NlZCBjb250cm9sIFZRIGFwcHJvYWNoIHJl
bWFpbnMNCj4gPj4+Pj4+Pj4+IHRyYW5zcG9ydC1pbmRlcGVuZGVudC4NCj4gPj4+Pj4+PiBTb3Vu
ZHMgbGlrZSBhbiBpbXBvcnRhbnQgbGltaXRhdGlvbiwgdG8gbWUuDQo+ID4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4gUGxlYXNlIGRlZmluZSBhZG1pbiBjb21tYW5kcyBmb3IgTU1JTyBhcyB3ZWxsIGlmIGl0
cyBuZWVkZWQuDQo+ID4+Pj4+Pj4gVHJhbnNwb3J0IGRldmVsb3BtZW50IGlzIGhhcmQsIE1NSU8g
ZXNwZWNpYWxseSBhcyB0aGVyZSdzIG5vDQo+ID4+Pj4+Pj4gYWN0aXZlIHRyYW5zcG9ydCBtYWlu
dGFpbmVyLA0KPiA+Pj4+Pj4gU2VlbXMgbGlrZSBhIHN0cm9uZyBoaW50IHRoYXQsIGl0IGhhcyBu
byBhY3RpdmUgdXNlciBiYXNlIGVpdGhlci4NCj4gPj4+Pj4+IG90aGVyd2lzZSBjb250cmlidXRp
b25zIHRvIE1NSU8gd291bGQgYmUgbW9yZS4NCj4gPj4+Pj4gWW91IG11c3QgYmUgam9raW5nLiBG
aXJlY3JhY2tlciBpcyB2aXJ0aW8gbW1pbyBldmVyIGhlYXJkIG9mIHRoaXMgc21hbGwNCj4gPj4+
Pj4gcHJvamVjdCBjYWxsZWQgQVdTPw0KPiA+Pj4+Pg0KPiA+Pj4+PiBPaCB5ZXMgaXQgaGFzIGFu
IGFjdGl2ZSB1c2VyYmFzZS4NCj4gPj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4+PiBpdCBpcyBhbGwg
ZHJpdmUgYnkgY29udHJpYnV0aW9ucywNCj4gPj4+Pj4+PiBhbmQgaXQgaGFzIHRvIHN0YXkgbGln
aHR3ZWlnaHQgYW5kIHNpbXBsZSB3aXRoIG1pbmltYWwgZXhpdHMuDQo+ID4+Pj4+Pj4NCj4gPj4+
Pj4+IE5vdCBzdXJlIGhvdyBDVlEgaXMgYW55IGxpZ2h0ZXIgdGhhbiBBUS4NCj4gPj4+Pj4+IEdp
dmVuIEFRIGlzIGdlbmVyaWMgYW5kIHZhbGlkYXRlZCBvbiBvdGhlciB0cmFuc3BvcnQsIHNlZW1z
IGEgbmF0dXJhbCBmaXQuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4+IEZsb3cgZmlsdGVyIGNhcGFiaWxp
dHkgdG8gd2hpY2ggeW91IHJlZmVyIGhlcmUgd2FzIGFkZGVkIG1vcmUgdGhhbg0KPiA+Pj4+Pj4+
IDIgeWVhcnMgYWdvLCBzdGlsbCBub3Qgc3VwcG9ydGVkIG9uIE1NSU8uDQo+ID4+Pj4+Pj4NCj4g
Pj4+Pj4+IE5vdCBmaW5kaW5nIGFueSB1c2VycyBkZW1hbmRpbmcgdGhpcyBlaXRoZXIgdW50aWwg
bm93Lg0KPiA+Pj4+PiBVc2VycyBkb24ndCBrbm93IGV4YWN0bHkgd2hhdCB0aGV5IHdhbnQsIG9m
dGVuLiBCdXQgeWVzIEFRIGlzIGNvbXBsYWluZWQNCj4gPj4+Pj4gYWJvdXQsIGFuZCBsYWNrIG9m
IGNvbXBsZXRlbmVzcyBhY3Jvc3MgdHJhbnNwb3J0cyBjb3VsZCBiZSBvbmUgcmVhc29uLg0KPiA+
Pj4+Pg0KPiA+Pj4+Pj4+IFNvIG5vLCBJIGFtIG5vdCBpbmNsaW5lZCB0byBhZ3JlZSBhbnkgYW5k
IGFsbCBjb250cmlidXRpb24gdG8gdmlydGlvIGlzDQo+ID4+Pj4+Pj4gbm93IGJsb2NrZWQgdW50
aWwgdGhpcyBpcyByZXNvbHZlZC4NCj4gPj4+Pj4+IE1heSBiZSBMaW5saW4gY2FuIHRha2UgYSBz
dGFiIGF0IGVuaGFuY2luZyBNTUlPIGZvciBhZG1pbiBjb21tYW5kcy4NCj4gPj4+Pj4+IFBhdGNo
IGlzIHdlbGNvbWluZyB0byBtZSB0byB1bmlmeSBhIHF1ZXVlIGFjcm9zcyB0d28gdHJhbnNwb3J0
cy4NCj4gPj4+Pj4NCj4gPj4+Pj4gSXQncyBhbiBvcHRpb24gSSdkIGJlIGZpbmUgd2l0aCwgYnV0
IEkgZm9yIG9uZSBpcyBub3Qgdm90aW5nIGFnYWluc3QgdGhlDQo+ID4+Pj4+IGZlYXR1cmUgaWYg
aGUgZG9lcyBub3Qgd2FudCB0by4gQW5kIEknZCBzYXkgY2N3IHRvby4NCj4gPj4+Pg0KPiA+Pj4+
IEFkZGluZyBvdGhlciB0cmFuc3BvcnRzIHRvIHN1cHBvcnQgQVEgaXMgb3J0aG9nb25hbCBmb3Ig
YWRkaW5nIGEgbmV3IGZlYXR1cmUNCj4gPj4+PiB0byBzb21lIHNwZWNpZmljIGRldmljZSB0aGF0
IHVzZXMgdGhlIEFRLg0KPiA+Pj4+DQo+ID4+Pj4gTGV0J3MgcGxlYXNlIHNlcGFyYXRlIGl0IGlu
dG8gMiBhY3Rpdml0aWVzLg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBBbmQgd2hvIGlz
IGRvaW5nIHRoZSBvdGhlciBhY3Rpdml0eSBhbmQgaW4gd2hhdCB0aW1lbGluZT8gaXQgZGlkIG5v
dA0KPiA+Pj4gaGFwcGVuIGluIG1vcmUgdGhhbiAyIHllYXJzLg0KPiA+Pj4NCj4gPj4+IEFnYWlu
IGlmIExpbmxpbiB3YW50cyB0byBzdWJtaXQgdGhlIGZlYXR1cmUgYXMgcGNpIHNwZWNpZmljIGZv
ciBub3csIEknZCBiZQ0KPiA+Pj4gZmluZSB3aXRoIHRoYXQsIHRvby4gQnV0IGlmIGhlIHdhbnRz
IGl0IGdlbmVyaWMgdGhlbiBJIGZvciBvbmUgYW0gc3ltcGF0aGV0aWMsDQo+ID4+PiBpdCBpcyBh
IHJlYXNvbmFibGUgdGhpbmcgdG8gd2FudCwgYW5kIHNhZGx5LCBBUSBhcyBhIGRlcGVuZGVuY3kg
aXMgb3V0IHRoZW4uDQo+ID4+DQo+ID4+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cyENCj4gPj4N
Cj4gPj4gQSBnZW5lcmljIHNvbHV0aW9uIGlzIHdoYXQgSSdtIGxvb2tpbmcgZm9yLCBzaW5jZSB0
aGUgdXNlIGNhc2UgSSdtIHdvcmtpbmcgb24NCj4gPj4gaXMgZW1iZWRkZWQgYW5kIGF1dG9tb3Rp
dmUgdmlydHVhbGl6YXRpb24gdXNpbmcgdGhlIHZpcnRpby1tbWlvIHRyYW5zcG9ydC4NCj4gPj4g
VGhlcmVmb3JlLCB0aGUgc29sdXRpb24gbmVlZHMgdG8gd29yayB3aXRoIHZpcnRpby1tbWlvIHJh
dGhlciB0aGFuIGJlaW5nDQo+ID4+IGxpbWl0ZWQgdG8gdmlydGlvLXBjaS4NCj4gPj4NCj4gPj4g
SSdtIGFmcmFpZCBJIGNhbm5vdCB0YWtlIG9uIHRoZSB2aXJ0aW8tbW1pbyBBZG1pbiBWUSB3b3Jr
IGFzIHBhcnQgb2YgdGhpcyBlZmZvcnQuDQo+ID4+IEl0IGlzIGEgc2lnbmlmaWNhbnRseSBsYXJn
ZXIgdHJhbnNwb3J0LWxldmVsIGNoYW5nZSwgYW5kIEkgZG9uJ3QgY3VycmVudGx5IGhhdmUNCj4g
Pj4gc3VmZmljaWVudCBiYW5kd2lkdGggdG8gaW1wbGVtZW50IGFuZCB2YWxpZGF0ZSBpdCBpbiBh
ZGRpdGlvbiB0byB0aGUgdmlydGlvLWJsaw0KPiA+PiBpbmxpbmUgZW5jcnlwdGlvbiB3b3JrLg0K
PiA+Pg0KPiA+IEkgZG9u4oCZdCB0aGluayBpdCBpcyBzaWduaWZpY2FudCB0cmFuc3BvcnQgbGV2
ZWwgY2hhbmdlLg0KPiA+IEl0IGlzIGp1c3QgYW4gYWRkaXRpb25hbCBWUSBsaWtlIENWUSB0byBi
ZSBhdmFpbGFibGUgb3B0aW9uYWxseS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24uDQo+IA0KPiBJIHN0aWxsIGhhdmUgb25lIGNvbmNlcm4gYWJvdXQgdXNpbmcgdGhlIEFkbWlu
IFZRIGhlcmUuIFNpbmNlIHRoZSBpbmxpbmUgZW5jcnlwdGlvbg0KPiBjb21tYW5kcyBhcmUgc3Bl
Y2lmaWMgdG8gYSBwYXJ0aWN1bGFyIHZpcnRpby1ibGsgZGV2aWNlLCBob3cgZG9lcyB0aGUgaG9z
dA0KPiBkZXRlcm1pbmUgd2hpY2ggZGV2aWNlIGFuIEFkbWluIFZRIGNvbW1hbmQgYXBwbGllcyB0
bz8NClRoZSBzYW1lIHdheSBhIGRyaXZlciB3b3VsZCBmaW5kIG91dCBpZiBpdCBzaG91bGQgaXNz
dWUgQ1ZRIGNtZCBvciBBVlEgY21kLg0KDQo+IA0KPiBJIGNvdWxkbid0IGZpbmQgYSBob3N0LXNp
ZGUgQWRtaW4gVlEgaW1wbGVtZW50YXRpb24sIGV2ZW4gZm9yIHZpcnRpby1wY2kuIENvdWxkIHlv
dQ0KPiBwbGVhc2UgcG9pbnQgbWUgdG8gYW4gZXhpc3RpbmcgaW1wbGVtZW50YXRpb24gb3IgZXhh
bXBsZT8NClN1Y2ggaW1wbGVtZW50YXRpb24gaXMgbm90IHJlbGF0ZWQgdG8gdmlydGlvIHNwZWMg
QVEvQ1ZRIGRpc2N1c3Npb24uDQo+IA0KPiA+DQo+ID4+IEkgYXBwcmVjaWF0ZSB5b3VyIHN1cHBv
cnQgZm9yIGtlZXBpbmcgdGhlIHNvbHV0aW9uIHRyYW5zcG9ydC1pbmRlcGVuZGVudC4NCj4gPg0K
PiA+IGFkbWluIGNvbW1hbmRzIGFuZCBBUSBpcyB0cmFuc3BvcnQgaW5kZXBlbmRlbnQuIFBsZWFz
ZSBleHBsb3JlIHRoZSBvcHRpb25hbCBuZXcgcmVnaXN0ZXJzIHRvIGV4cG9zZS4NCj4gPiBJIHdp
bGwgYWxzbyBleHBsb3JlIHRoaXMgZWFybHkgbmV4dCB3ZWVrIG9mIGl0IG9mIHdoYXQgY2hhbmdl
cyBuZWVkZWQuDQo+IA0KPiBUaGFua3MhDQo+IA0KPiBJIHNlZSB5b3UgYWxyZWFkeSBwb3N0ZWQg
dGhlIHBhdGNoIG9mIEFkbWluIFZRIHN1cHBvcnQgZm9yIHZpcnRpbyBNTUlPIGZvciByZXZpZXcu
DQo+IEknbGwgcmV2aWV3IGl0IHRvZGF5IG9yIHRvbW1vcm93Lg0KDQpUaGFua3MgYSBsb3QuDQo=
