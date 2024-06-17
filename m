Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B613D6A
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 03:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718593261; cv=fail; b=YZwifgHq1PvhSxmAhh8/cRgdkVPSN79hFOcZUwYw6/mn56xgn5PpnvKaZu0Z10lgGLoJRTeOCpqxGxYRU6ozZGb6sT//p5sxWAAbIwPR+40kozIKtMI7oiYnL4AE/KmEygO3lcKEqZvyKPIIs902rETwjN5gnrCEu7iAdAjFTFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718593261; c=relaxed/simple;
	bh=8ufJZZ8pg2nQ+VCfJUsSae4ei7rKhT6iC3Ka9U6cSoY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xk0W9dZSOB6PstE0Dzap4i466ycY2QD1KXAC/qC2G1UDEAQBraYSsYcwxR/vni8DaTEzwQNNOd4uObpLPZ7B2EhRlxkSSYkI9gnRTKs4XbgqTpVooY9stbQqnRsUdAnFjFCGYrKJV6/o2BaLmgDpWc4GOtInEjK0xMbA7Aghz28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rARsAJ1q; arc=fail smtp.client-ip=40.107.100.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rARsAJ1q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXXrn6L1Cs0ShBDRb5fnsAItUEByCvAjdaE1tth0U/8uxq1JB4xKbpdn2w/RmQnFeTnzXjdlKCi4L4j8g7la4L+hMp9yAjTwr7IGTRavfNyUaKMzvHAm77pLQzuVIBRJp19yXtVjCgWRryv+IjjtmuJdTEZKeG4zDWB36wt8kkKhpbZ8NRSysUZwAkU5H8lrJNg9965EhpD5ZM6vBaa2Y+pMjAJhR0uTcI+VLYDD7uJSFwOvp3MyyCwKolJp1hZ0bQzbElHg3b90+BQwcF3fO+zlfT/F73Nv2nCzN1dHci84NBM8ik9tyNIF1/bfyYSple3IG262mwjlFZ2uQYLBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ufJZZ8pg2nQ+VCfJUsSae4ei7rKhT6iC3Ka9U6cSoY=;
 b=EQ87+S3rQw9nc8t8R0V8GE6Xz1bowFFRndQrNQdBwIeD+No7VM3TnAZqqCEkY6aZjc1jFXFNeU4j7hctUqzbPxE7jBn7I/Yxu6E5hccRDKlrnwWL3Qz8N5s/g1Tq3OxDrJpa8xL2+IZhEK+v74SrMX9LsaPP2ru67zjr7fPJLdRnJ6AjbRCQ0nogq+RX/7998MFB1epVv0uVfNwe5pp9HOHu2hjQDTrvO/GHXzGefNWYZUGdSAhBhfBv4OaKWu8HH9DfH4sMECoojVYhvbtr0ZXY9zgrfW2lu2xTJy+tyvsZBS+PH/qVBkyeKr7VtOCq2iCCMfZwLPDlun47dL3U2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ufJZZ8pg2nQ+VCfJUsSae4ei7rKhT6iC3Ka9U6cSoY=;
 b=rARsAJ1qfKKrvsEsyuSVREq4sLNeXfQESWiLrNUruqCQaTH7Z+e+HTXLi5EJk42S2Zxu7Vgd6cyGdh0eESDcdBsufKJC8JH0GPYlpKFnID04qghfjyYPV3O3OnCBPVp8r54RdwfPxMTbhi0TCqSw5t9tyqaFdxw+2wjtE0GdnI24y5o2pGACrsyevzBifK2n9YBEZxMg6A5jtA/IiR8ttzJ3LX/HPBM5mQQq1z40B5Emyse0RLw3kkrpJt0vpCR0KJMZt6sWBaTwCSoaEE32WbPrDF8wgeibfJVhkBqsUx6m/lfsjTr0GgJYr8Ofw2Ag5UoPFkPvIaUOBD/SJwL9Jw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 03:00:55 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 03:00:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: Zhu Lingshan <lingshan.zhu@amd.com>, David Stevens
	<stevensd@chromium.org>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
	<cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>
Subject: RE: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHauK5veGmfTEYzl0u4eTEkaSch67HBLmKAgADZnUCAADjDgIAABE1QgAAOSoCAAAA+cIAACrUAgAAEsSCAAX7ugIAADIHggAAHPACAAA394IAAEL8AgAEnjgCAAENfAIACw1UwgAMGWQCAAAneEA==
Date: Mon, 17 Jun 2024 03:00:55 +0000
Message-ID:
 <PH0PR12MB54811F50FC3DD526BC0D14F3DCCD2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
 <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20240612081135-mutt-send-email-mst@kernel.org>
 <CAD=HUj5oeJa3Przmsd+MYDO0AAEhs-4sDvFQoiMhVTjnveNONw@mail.gmail.com>
 <40c1d6fb-c04e-41b4-a4d3-baf36aba7d15@amd.com>
 <PH0PR12MB5481C44455741A4A1F36C8FFDCC32@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu09XU-1E4ib4nD3Fk=tz40-sEu=C14XbEpUZ9SwQdJcg@mail.gmail.com>
In-Reply-To:
 <CACGkMEu09XU-1E4ib4nD3Fk=tz40-sEu=C14XbEpUZ9SwQdJcg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6447:EE_
x-ms-office365-filtering-correlation-id: 8046198f-5597-431f-d150-08dc8e79b4f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXZEbU9aaEJzTnBtRVlhcUE5cS9PNVBwT3M5bzVHazZRakZPR3o2TEFUR1BC?=
 =?utf-8?B?TmhpL0VKVDR0ZHZKbCs2M1RnQzAvRUNvaUtjOVQ1ZnUyVUtuRFp0eFdUQnFL?=
 =?utf-8?B?NU51bmdtcEJEclRNNE9SZVhpT01Ycm43bGFnNGdTcnpkS1BPSmR6ME05MlFV?=
 =?utf-8?B?NThnNjNVQWgwam5aVFkxSzM2ejVwdW1aTXkxN3hpVFl3OFB4Y051YVhSNmlF?=
 =?utf-8?B?UjBseTlCbE9xOUJIdGxrV0xXWXhONmR0dUhtS0E4MndpdWJKYm9JeDVNRS9u?=
 =?utf-8?B?bENWa3RRajBDbUFuWXZJcGZLZXdUbUZUSnZ4R3F0T0NJVTdzeEtCcGp0OXJ6?=
 =?utf-8?B?Z3RxbGlJbG1iNzg4NWNwT1JDbnYwZGxqVnVjYWk0ZjRyZS8zYWEyWEVObGFN?=
 =?utf-8?B?akhWMzNLL1k1SHFUZDZoV05jTkk5dSt3bklRR3BEUjA1OWFDcXVsYU8xSi81?=
 =?utf-8?B?MmlDbVlDNXplUVFVUDlFV3I1dzVKekE4L3pIS0tWV0VvTFZLVGltWWY1QWtY?=
 =?utf-8?B?L1lpT2s0MXVXTVdsWUNvMTM1ekViMWxBQUVlalJGUjZpOFAxODM0YUErNGhr?=
 =?utf-8?B?QUg2aGIwTkpKQkwwSkp0NHZicWpmc2V6V1l1dlRBMGNuTzZMUnZ1RE5oS3NF?=
 =?utf-8?B?K0kxRUJCSnZYamdEZ2VYRTliY3RQU1MyTjdYeWJsZC9jRHpaQ2J6bzc5SStJ?=
 =?utf-8?B?QU42ZXFNV0dQbkVSelVGTkg4OG5wM2ZVSjcyMVhNMWtaNWsxL1FJN2x2TTBX?=
 =?utf-8?B?VSt6SGJYZXJ2VEQ3dnUydzdHc0gzVy9KWjdMblEzQ1lrTnk1UW5OaFJ6Ujhs?=
 =?utf-8?B?Slo0emNCV280ZnliaktCVXdGSW14NFpkanc3WkVIWmRZckVBVHVuYS9BZktV?=
 =?utf-8?B?V0pGcDVNaG1kTm5QVWtoMkc3OTFnNUFOWWExeFl4VGw5WTdHUFdwTm50ZUl2?=
 =?utf-8?B?NGNuMzJNNlh4VXpSdlQ2TFNwREVQYzF3Tlc2YVo2TkhUeXB4ZnUzRGNyRFlO?=
 =?utf-8?B?R3FQemwvblZpNC81dGd0YUhNTjgyMXNDZERDOWU0eGlUQzU5VlRtWjNMcTJr?=
 =?utf-8?B?OUMvQW45SXVxcEhVOVQxZGgyaFIwcDRNWWg3ajV3Y0RHV2kvNi9Icm91Z256?=
 =?utf-8?B?UGNjL2NEV2JBYXlXb2g2eFAwenBQTllIRTNReGM5V3J3VHlWOFU4Z1BrUUJJ?=
 =?utf-8?B?MGx4MGk4TVBOUnRaMzhhKzlFZEFBaGR1ejlXSEdxc1F6MEFyd2t5aDcxQnNz?=
 =?utf-8?B?eWo5UzREdUpLM1N5eUp2Ym5tY0FzUENzWERwMmt5YlFvdUk3L3piRlg2U244?=
 =?utf-8?B?U0ZGSFY0RmJGK3hKbDMvRU5JMWFhTzJjSnZFSmpsRW1Ic2NsMmpuK0xjM1cx?=
 =?utf-8?B?bXlHdDZPRUhwMjZxcjArbi9pSmFQNktzbnQwNVlacWJLcXNJaHRacHBjMnd6?=
 =?utf-8?B?amxCcVE0ZjBmSlBVTmlrRXhzcFZjaVozM3l3VENkZFJ0NVI0R2E2Yk1LQ1Jh?=
 =?utf-8?B?MHVCZm1IQ0NVb1JZMFBTakk5Z3RaNDY2b1p2YUQyeHRYeU4va2svdDBPdkhw?=
 =?utf-8?B?V2QvU0lYS296TzkzaE0wWnNPWDhaU1NQcTZLcFR2YmlRd2QxcGI3TDdqc0RI?=
 =?utf-8?B?VFV4blZPN1M4dHg5WGVwa3VuYXVxc05WdytwVlVmUDB4MHNjLzN0b3NjZlZw?=
 =?utf-8?B?UlFjYk9QTFQrLzVNblRsMTh1T3VLY0g4bWFibmtJemFkSEgxQWloUzh2ZlYy?=
 =?utf-8?B?QldEYjdjSDBzV0FHOFFHbFdVUmMyTXJKSW1lR0lFcU1ibm5mY0ZIU09zSzdz?=
 =?utf-8?Q?sxZrYxXzf1sDSF5c/4ZcZdR3pXQnwZ2MKQ7+0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTZGSFE4LzdLek53N1BhZUtXZ0I1bUZtNkc0YjcwM0l4bWE1VnpyUU9oNmFt?=
 =?utf-8?B?WDRyNkpJaWpDUDRUVHhha1QrNUpWZEFLZDVaaEs2MVZSbTNKdG95NzlxeXFy?=
 =?utf-8?B?STNGOE9sMnQyOWhmWGpyTWdHblk5U0VLWGh2L1c1M21PUEZhemlpUm9qV1BT?=
 =?utf-8?B?M2M0ZmtXSDk3c000MmZlR2I4V0Q3cEMxSHptRE83SHljSnhaQjIxaGwxczU3?=
 =?utf-8?B?VHNwU1Q4K24rakVjZTM2aG8yWTg2dCs4eElpTy83ODNLVlB4ZlRPZXQ4c3BK?=
 =?utf-8?B?TkloTWYxcXUvc1dHeDg4SzNKaVM3bXRoa0JYRE9ITFJ5dEg3YjNzRkpoL3ht?=
 =?utf-8?B?MVpKdmRTMGRKWUZZWDJob2ZiaVMyT0FzTlVieG9hVjExbDBSNDBxL3VLSmpJ?=
 =?utf-8?B?OG1OOC9YVG1nSXhoNE90NHRCSUtGUTgySTNOSXFpUWFXZ3pxRkljdFo5RXpk?=
 =?utf-8?B?cmhESzB3RENrQVYwamFjeUVodVlhNHhvYWxxNlhtaC9QOUtVZ1dnK1ZPSWFq?=
 =?utf-8?B?Zm13YS9CVzdaZU9xN0UvMy9Jc2VXSGZ6OE5rUjdjR0swMjhRQ0Z0bWlVbTNY?=
 =?utf-8?B?aXBDS2xRcEZHS0dXK05YcUN6QlRzeUw0d1NVcWg3Z1d2cGx6OXNzYmFRZGtu?=
 =?utf-8?B?R3VxVzZLSHc4cmFkcHNLckJSZzNwMGlBZ3lndHZRMWFMYXBSMkFhaXR2SjRI?=
 =?utf-8?B?NG56amx5d0xISEZ1Z2xLa0tTRWt3VjY0K2ptNUR1UkRBMkVCRFlxZCs3R1V0?=
 =?utf-8?B?MHFkTC9ZMVpZa3hxRW5WL0cxWDY4TjhlaHBsRHQrWGJKckt6TTBrM3JTcGVT?=
 =?utf-8?B?ZnhUN05kWXcwZ1dqdXo0VncvdG5mRHZOU3VxdzFEbGV4Zks2aTIrV2dIQ09j?=
 =?utf-8?B?bEJhbGNOZjFmY2JVblBxN1JIZVIxOU9NTDUvZ3RLWkhyMlJlVUhiMUY2UGVP?=
 =?utf-8?B?YzJQdnc0SkFPMnNWdGJsYzhLOGVValhucVRrNDZlb1RFdkZCWjhTbnViZ2Yz?=
 =?utf-8?B?cUFUQTF3SGZlRXZhdi9rUGJTWDYrcVVwWDV3YTN4TDk0aitudG9GUDQ2OVY2?=
 =?utf-8?B?MldaZUk4UmVwQnIrRmtnVk8yQk9FMTBDR1F4VlZtcjRpV0ZXT3FKenVOMmpC?=
 =?utf-8?B?UzNFRzQ1cm8yTXpCOGNxa294QWpXQUF0QUQzMisrWG1kc2VucmxBbW44NXZD?=
 =?utf-8?B?UEF2cDBoZzBTck8zalZUczcyQVp2NmRNcnArQk9hayt6NktuTjcxWmU0YXNV?=
 =?utf-8?B?SGpBUWtidkhaNWlOaVB0amJ4V3BYNVMyV1ExZCtiMmtrTkxoRzZLbTdZWERN?=
 =?utf-8?B?Smg5dnVMUnVMTVZneFdSTm4ycFFVWHE1RWNyM2J5SnpBdC9OcE5mY2V2ajNG?=
 =?utf-8?B?bHJEQnlvVDBWYTlaU3RYL3ZXWXdsWS9VWUJNWUVYNlFQQjAzelRBMXhXTGVS?=
 =?utf-8?B?ci9nZHphWW5PRTZSZWJJMTN2Y3VhSVFIOGV3TzRpbUZ5cEx3MGg3TTRBbU1r?=
 =?utf-8?B?dGNMMDEwN2FDN2lteWpLYUV6WUl3WHVHb0tEeGZNTnFGV0gvekRuQ0R4WjR5?=
 =?utf-8?B?TWZSdmVaaFNQQlZPTDBsL2lZQWZ0NVZ2NUVwYit3bEZDTE5FWUFULzJZMUJZ?=
 =?utf-8?B?OTdGNFFQdjJTSXA2ZGYxUXp5d0MxYjh5cG9TNnhZS016amFKMHZVejIvc3NW?=
 =?utf-8?B?b0FZd0h5alQ3K0VKVHZEcVFWcUZId2h2MVFiTUY2Zyt3c2R0R1NTcjJHYy8r?=
 =?utf-8?B?aEk2L2NTaG1IRmpoSk5KQXVvTWFtMFRQMHpsbWNaTU00bU5xQnI4NVBVNzBl?=
 =?utf-8?B?dXFPUnhHVFlZMzZMTDczS2taUU0rd21ia1lCRUtyQ0R4ekZYaXhvS2k3UFhp?=
 =?utf-8?B?ckNWblRUZEVXenNIK3ZlT2JQNGwzVlJRejlLc2dCaEY4ckhFRHRzenVhQkdl?=
 =?utf-8?B?YWMvN3phVnU1TSsrQm5iNjkzUWhJeWhFY045NlRCaytLS2ROZi9WcHl6emt2?=
 =?utf-8?B?VjQwR2Vqd0s5TkVGVVNhajByUDl6S043clpVbjNZdkhadkhMZTB6bFMyU01X?=
 =?utf-8?B?Y0o0WmM3TlRncm1LRTViRm00UXlBZDRCL3FRMnNwNzlyclV0VURvRFRORHJ2?=
 =?utf-8?Q?lxtI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8046198f-5597-431f-d150-08dc8e79b4f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 03:00:55.7608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVYg+i4uZGpnol2Iu4b3zO0IGaR2XPnK/NtgmiTLkPaRlcQT7YQ4iE/HR7/8AMjS0ZCMNEvncvhge58EVLCbyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgSnVuZSAxNywgMjAyNCA3OjUyIEFNDQo+IA0KPiBPbiBTYXQsIEp1biAxNSwgMjAyNCBhdCAx
MjozM+KAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiA+IEZyb206IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGFtZC5jb20+DQo+ID4gPiBTZW50
OiBUaHVyc2RheSwgSnVuZSAxMywgMjAyNCAzOjI5IFBNDQo+ID4gPg0KPiA+ID4gT24gNi8xMy8y
MDI0IDE6NTggUE0sIERhdmlkIFN0ZXZlbnMgd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgSnVuIDEy
LCAyMDI0IGF0IDk6MjDigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPiA+ID4gPG1zdEByZWRo
YXQuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+PiBPbiBXZWQsIEp1biAxMiwgMjAyNCBhdCAx
MToyNjozOUFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+Pj4gTm8gbG9ja3Mg
YXJlIG5lZWRlZC4gSHlwZXJ2aXNvciBpcyBhY2Nlc3NpbmcgdGhlIGFkbWluIHZxIG9uIHRoZSBQ
Ri4NCj4gPiA+ID4+IEknbSBub3QgZXZlbiBnb2luZyB0byB0cnkgYW5kIGdldCB0aHJvdWdoIGEg
anVtYmxlIG9mIHRoaXMgdGhyZWFkDQo+ID4gPiA+PiBoZWF2aWx5IGNvcnJ1cHRlZCBieSBvdXRs
b29rIGFuZCB3aGF0bm90LCBidXQgZnJvbSB0aGUgZ2xpbXBzZXMgSQ0KPiA+ID4gPj4gZ290IHRo
aXMgZGlzY3Vzc2lvbiBsb29rcyBsaWtlIGp1c3QgdHdvIHBlb3BsZSB0YWxraW5nIHBhc3QgZWFj
aCBvdGhlci4NCj4gPiA+ID4+IExpbmdzaGFuLCBQYXJhdidzIG5vdCB0aGUgb25seSBvbmUgYm90
aGVyZWQgYnkgaG93IHRoZSBkZXZpY2UNCj4gPiA+ID4+IHNlZW1pbmdseSBoYXMgdG8gYmxvY2sg
YSB0cmFuc2FjdGlvbiB1bnRpbCBpdCBjb21wbGV0ZXMgc3VzcGVuZC4NCj4gPiA+ID4+IFBhcmF2
LCBJIGZlZWwgaG93IHRvIGFkZHJlc3MgdGhpcyBpcyB1cCB0byB0aGUgYXV0aG9yIHRvIHJlc29s
dmUNCj4gPiA+ID4+IHJlYWxseSwgbGVhdmUNCj4gPiA+IGl0IGF0IHRoYXQuDQo+ID4gPiA+IElJ
VUMsIFByYXZhJ3MgY29uY2VybiBoZXJlIGlzIHRoYXQgd2l0aCB0aGUgY3VycmVudCBwcm9wb3Nh
bCwgdGhlDQo+ID4gPiA+IGRldmljZSdzIHN0YXRlIGNhbid0IGJlIGRldGVybWluZWQgdW5hbWJp
Z3VvdXNseSBieSByZWFkaW5nIHRoZQ0KPiA+ID4gPiBkZXZpY2Ugc3RhdHVzIGZpZWxkLiBJZiB0
aGUgU1VTUEVORCBiaXQgaXMgMCwgaXQncyBhbWJpZ3VvdXMgYXMgdG8NCj4gPiA+ID4gd2hldGhl
ciB0aGUgZGV2aWNlIGlzIHJ1bm5pbmcgbm9ybWFsbHkgb3IgaWYgaXQncyBpbiB0aGUgcHJvY2Vz
cw0KPiA+ID4gPiBvZiBzdXNwZW5kaW5nLCBhbmQgdGhlcmUgaXMgYSBjb3JyZXNwb25kaW5nIGlz
c3VlIGZvciBzdXNwZW5kZWQgdnMNCj4gPiA+ID4gcmVzdW1pbmcuIFRoZSBkZXZpY2UgYW5kIGRy
aXZlciBjYW4ga25vdyBiYXNlZCBvbiB0aGVpciBpbnRlcm5hbA0KPiA+ID4gPiBpbmZvcm1hdGlv
biB3aGF0IHN0YXRlIHRoZSBkZXZpY2UgaXMgaW4uIEhvd2V2ZXIsIHNvbWUNCj4gPiA+ID4gaHlw
b3RoZXRpY2FsIGFkbWluIHRvb2wgaW4gZ3Vlc3QgdXNlcnNwYWNlIHdvdWxkbid0IGJlIGFibGUg
dG8NCj4gPiA+ID4gdGVsbCBzaW1wbHkgYnkgcmVhZGluZyB0aGUgdmFsdWVzIGluIHRoZSBQQ0kg
QkFSLg0KPiA+ID4gPg0KPiA+ID4gPiBBc3N1bWluZyB0aGF0J3MgYWN0dWFsbHkgYSBwcm9ibGVt
IHRoYXQgd2Ugd2FudCB0byBzb2x2ZSwgdGhlbiBJDQo+ID4gPiA+IHRoaW5rIHRoZSBtb3N0IHN0
cmFpZ2h0Zm9yd2FyZCB3YXkgdG8gYWRkcmVzcyB0aGlzIHdvdWxkIGJlIHRvIHVzZQ0KPiA+ID4g
PiBhbm90aGVyIGJpdCBpbiB0aGUgc3RhdHVzIGZpZWxkIGFzIGEgU1VTUEVORF9UUkFOU0lUSU9O
IGJpdCwgd2l0aA0KPiA+ID4gPiBzb21ldGhpbmcNCj4gPiA+ID4gbGlrZToNCj4gPiA+ID4NCj4g
PiA+ID4gIkFmdGVyIHRoZSBkcml2ZXIgd3JpdGVzIG9yIGNsZWFycyB0aGUgU1VTUEVORCBiaXQs
IHRoZSBkZXZpY2UNCj4gPiA+ID4gTVVTVCBwcmVzZW50IHRoZSBTVVNQRU5EX1RSQU5TSVRJT04g
Yml0IHVudGlsIGl0IGNvbXBsZXRlcyB0aGUNCj4gPiA+ID4gcmVxdWVzdGVkIHN1c3BlbmQgb3Ig
cmVzdW1lIHRyYW5zaXRpb24uIElmIHRoZSBkZXZpY2UgaXMgdW5hYmxlIHRvDQo+ID4gPiA+IHN1
Y2Nlc3NmdWxseSBjb21wbGV0ZSB0aGUgdHJhbnNpdGlvbiwgaXQgTVVTVCBwcmVzZW50DQo+IERF
VklDRV9ORUVEU19SRVNFVC4iDQo+ID4gPiA+DQo+ID4gPiA+IERvaW5nIHRoYXQgd291bGQgZ2l2
ZSBkaXN0aW5jdCB2YWx1ZXMgZm9yIGVhY2ggb2YgdGhlDQo+ID4gPiA+IHJ1bm5pbmcvc3VzcGVu
ZGluZy9zdXNwZW5kZWQvcmVzdW1pbmcgc3RhdGVzLiBUaGF0IHNhaWQsIGFsdGhvdWdoDQo+ID4g
PiA+IHRoZSBkZXZpY2Ugc3RhdHVzIGZpZWxkIGRvZXNuJ3QgaGF2ZSBhIGRlZmluZWQgd2lkdGgs
IGJvdGggdGhlIFBDSQ0KPiA+ID4gPiBhbmQgY2hhbm5lbCB0cmFuc3BvcnRzIGFzc3VtZSB0aGF0
IGl0J3MgYSBzaW5nbGUgYnl0ZSwgc28gd2UnZCBiZQ0KPiA+ID4gPiB1c2luZyB0aGUgbGFzdCBy
ZW1haW5pbmcgYml0cyB0aG9zZSB0cmFuc3BvcnRzIGhhdmUgYXZhaWxhYmxlLg0KPiA+ID4gQ3Vy
cmVudCBzcGVjIGRvZXMgbm90IGhhbmRsZSBzdGF0dXMgdHJhbnNpdGlvbnMgd2VsbCwgbm90IG9u
bHkgZm9yDQo+ID4gPiBTVVNQRU5EIGFuZCByZXN1bWluZy4NCj4gPiA+IG90aGVyIHN0YXR1cyB0
cmFuc2l0aW9ucyBtYXkgYWxzbyB0YWtlIGxvbmdlciB0aW1lIHRoYW4gZXhwZWN0DQo+ID4gPiBk
ZXBlbmRzIG9uIGhvdyB0aGUgZGV2aWNlIGlzIGltcGxlbWVudGVkLCBpdCBjYW4gYmUgc2x1Z2dp
c2ggaWYNCj4gPiA+IGltcGxlbWVudGVkIGJ5IFNXIGR1cmluZyBoaWdoIHRyYWZmaWMsIGV2ZW4g
d2hlbiBoYW5kbGluZw0KPiA+ID4gRkVBVFVSRVNfT0sgb3IgcHJlc2VudCBORUVEU19SRVNFVC4N
Cj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIHdhbnRzIHRvIGNvcHkgdGhlIG1lY2hhbmlzbSBvZiBo
YW5kbGluZyBGRUFUVVJFU19PSywgYnV0DQo+ID4gPiBpZiB3ZSB3YW50IHRvIHJlc29sdmUgdGhl
IHByb2JsZW0gb2YgZGV2aWNlIHN0YXR1cyB0cmFuc2l0aW9uLCBJDQo+ID4gPiBhZ3JlZSB0byBh
ZGQgYSBuZXcgc3RhdHVzIGJpdDogVFJBTlNJVElPTi4NCj4gPiA+DQo+ID4gPiBUaGUgZGV2aWNl
IHNob3VsZCBwcmVzZW50IFRSQU5TSVRJT04gdW50aWwgaXQgY29tcGxldGUgdGhlIHJlcXVlc3Rl
ZA0KPiA+ID4gc3RhdHVzIHRyYW5zaXRpb24uDQo+ID4gPiBDb21iaW5pbmcgdGhlIGtub3dsZWRn
ZSBvZiB0aGUgZGV2aWNlLCB0aGUgZHJpdmVyIGNhbiB0ZWxsIHRoZSBleGFjdA0KPiA+ID4gZGV2
aWNlIHN0YXR1cy4NCj4gPiA+DQo+ID4gWWVzLCB0aGlzIHdpbGwgYmUgZ29vZCBpZGVhLg0KPiA+
IFRoZSBUUkFOU0lUSU9OIGJpdCB3aGljaCBtdXN0IHR1cm4gdmVyeSBxdWlja2x5IHRvIDEgb24g
YW4gTU1JTyB3cml0ZQ0KPiByZXF1aXJlcyB2ZXJ5IHNwZWNpYWwgY2lyY3VpdHJ5Lg0KPiA+IEl0
IG5lZWRzIHRvIHR1cm4gMSBqdXN0IGJlZm9yZSB0aGUgbmV4dCByZWFkIGFycml2ZXMgZnJvbSB0
aGUgZ3Vlc3QgZHJpdmVyLg0KPiA+IFRoaXMgaXMgcm91Z2hseSAxMG5zZWMgb2YgdGltZSAod3Jp
dGUgZm9sbG93ZWQgYnkgYSByZWFkKS4NCj4gPg0KPiA+IFRvIHNpbXBsaWZ5IHRoaXMgYXNwZWN0
LCBhIGJldHRlciBhcHByb2FjaCBjYW4gYmUsIDEuIGRldmljZV9zdGF0dXMgdG8NCj4gPiBoYXZl
IFNVU1BFTkRFRCBiaXQsIHdoaWNoIHN0YXJ0cyB3aXRoIDAuDQo+ID4gMi4gYSBuZXcgY3RybF9y
ZWdpc3RlciBpcyBhZGRlZC4gV2hlbiBjbWQgaXMgd3JpdHRlbiB0aGVyZSwgaXRzIHN0YXR1cw0K
PiByZWZsZWN0cyBpbiBkZXZpY2Vfc3RhdHVzLg0KPiA+DQo+ID4gMy4gU28gZXZlbiBpZiB0aGUg
ZGV2aWNlIHRha2VzIDMwbnNlYyBvciAzMHVzZWMgdG8gcmVzcG9uZCwgdGhpbmdzIGRvbuKAmXQN
Cj4gYnJlYWsuDQo+ID4NCj4gPiBGb3IgZXhhbXBsZSwNCj4gPiBhLiBkcml2ZXIgd3JpdGVzIGRl
dmljZV9jdHJsID0gMHgxIChjbWQ9c3VzcGVuZCkgYi4gZHJpdmVyIHJlYWRzDQo+ID4gZGV2aWNl
X3N0YXR1cyA9IChzdXNwZW5kZWQ9MCkgLT4gbm90IHlldCBzdXNwZW5kZWQgYy4gZHJpdmVyIGxv
b3BzIG9uDQo+ID4gI2IgZmV3IG1vcmUgbnNlY3MuDQo+ID4gZC4gZmluYWxseSBkZXZpY2UgdHVy
bnMgaXQgc3VzcGVuZGVkLiAgU28gI2IgcmV0dXJucyBzdXBlbmRlZD0xLg0KPiANCj4gSXMgdGhl
cmUgYW55IHJlYWwgZGlmZmVyZW5jZT8gQ3VycmVudGx5LCB0cmFuc2l0aW9ucyBjb3VsZCBiZSBz
cG90dGVkIGJ5IHRoZQ0KPiBkcml2ZXIgZWFzaWx5OiByZWFkIGFmdGVyIHdyaXRlIGRvZXNuJ3Qg
bWF0Y2guDQo+DQpZZXMsIHRoZSByZWFsIGRpZmZlcmVuY2UgaXM6IHNpbXBsaWZpZWQgZGV2aWNl
IGltcGxlbWVudGF0aW9uLg0KVGhlIGRldmljZSBkb2VzIG5vdCBoYXZlIHRoZSB0aW1lIGNvbnN0
cmFpbnQgdG8gcmVwbHkgKHRyYW5zaXRpb249MSkgdG8gdGhlIGluY29taW5nIHJlYWQgaW4gbmV4
dCAxMG5zZWMuDQo=
