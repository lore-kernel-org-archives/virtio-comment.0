Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF861A4E6E
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 04:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725339264; cv=fail; b=aszD8Z3xN6BJrFXmV6CrythtKRRfyUoJ5EW04tI41eyGHNNWdlRlPIIfutQ/8cQujWheGOq/LZ2LgJY8gtLUb3dXQGTLbRKI2v7AWJeiA/fHf/dRpntedZc7GfW9Rj0nkLQ8UgKRKP217LjlDeKoeB0NsSV8hLYPYZEKToL46L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725339264; c=relaxed/simple;
	bh=7nGH+S0px9SdfJdwsNOo0h/uPXREaLYBTpOTcLOhvAk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=omkiHCfBwjYP1lCRH++Goq5kFi53ktYpPwOzkCXatdAGeNEka72tRh8nE2DcP9HppTt2GFx9QqLFp2eSXdXKnQJGMNIvl31i48p52VAkV68GV1B07TRwTPoBTwJh1eo7muKjYLyU0eYRAk+pzM3budLDvsIK/FrEEE13tKwTAMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DhkBh6nJ; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DhkBh6nJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk5/OtPtgyaOJB72dUCfE11yzm3wDl7vIzwjxZtUw3Cz4RS9yZJ5DUv/C5XfDNOQKK061Sg/UFiva3Lzj1KvI/WScA/Xx1dvcf4sGeOTJk5M6CpBxR6ARTympOWaf9ijntQJWsafN0LCh5SRdvDoR+FwToWMKdCu1jLDYYKmW7Vc9DbPgl0UsrZLfJsj68UkH92cAf7JPIRH2cUnLxnUTTX5Iy7kOajW5AXueM9PDsC8xhX7Vxw3ch8b+zcGLgHrRtVxub4wLc4B/hw1zuUtH/SH4Pz6EL5CeIi0dmtnyLWs6PqAVTUwaNHAp3d3ZdKMsNw8S45kcJKKv0RqAuQk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nGH+S0px9SdfJdwsNOo0h/uPXREaLYBTpOTcLOhvAk=;
 b=y/9UZh/8DY/jvz2nvwL5mOQvZA5AkUFjmDRgDE4kE0Xqo7VH9q7K5E6dNI5DaDYJil6+CVODUY/eS4OztiY+SkZ8Fl/C57gy48UdgNjrh5HFu6FR+onjQyEQOT5EbUNA6DW4G1kTlH/KHw+B07rxF2dJ6d3s/LJnB4tC3YxxbTB7U9sPvrXY4uDNlMtSljOH699iN4uip3nFw/Ygy//N1z4MIyRFYCBdXGxr9Ktz6w08EoyXavqhjSt7rvyNCTOYBOVe13RQa+9fsM1hN4kNvwIQRsZ40CHZXaB9C7e/ezzoDwUhHy85HDsoh9A56dwTaxWhaEdISQ/8Jmwi0ZzrTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nGH+S0px9SdfJdwsNOo0h/uPXREaLYBTpOTcLOhvAk=;
 b=DhkBh6nJbfo/aSuyxT+sovBLUal2PlJUTfDby0C7QE4KD9NSW+OUMcdlMTO8kFOGIG5SkPhIJhLADXuYOeqyXAoELMiZINtRyW6BFyGvsfGVNe+nyNRExSv4g5LTwpbZ4m88CGWn7wo5O58YStBi8ZjwW939vFETrV4D3VxuxnWGRs8e7UZ4w3QL6D1cotpsjHRBBJyj4GLa0EUBMGR2lCPKWEowAGFg3cLqx4B6eQKl+amxKbg+zh+1an+qKEGssMagKHpuv+/1E0Xr64XXis6X8PvOQiz2kI7BKRpFjYldf9rV5pfqkKHPkxwEALY0eHY0PRi+A6hM8DGTPJagqw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 04:54:19 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 04:54:19 +0000
From: Parav Pandit <parav@nvidia.com>
To: "tan.hu@zte.com.cn" <tan.hu@zte.com.cn>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"liu.jie97@zte.com.cn" <liu.jie97@zte.com.cn>, "zhang.yajun@zte.com.cn"
	<zhang.yajun@zte.com.cn>, "li.laishui@zte.com.cn" <li.laishui@zte.com.cn>
Subject: RE: Ping: [RFC PATCH] VIRTIO_F_PACKED_RING_BATCH: add support for
 batch fetching packed ring descriptors on devices
Thread-Topic: Ping: [RFC PATCH] VIRTIO_F_PACKED_RING_BATCH: add support for
 batch fetching packed ring descriptors on devices
Thread-Index: AQHa4ibw7wYaZpYtj0ekd/ToCppZYLJEtueAgAD6LTA=
Date: Tue, 3 Sep 2024 04:54:19 +0000
Message-ID:
 <IA0PR12MB8713FFC3D194339FB9B9158EDC932@IA0PR12MB8713.namprd12.prod.outlook.com>
References: 20240730101758667R0RC516SBxdCsM2K3dzNk@zte.com.cn
 <20240902213959040zgz5HnwxCr2uHqKd4wN46@zte.com.cn>
In-Reply-To: <20240902213959040zgz5HnwxCr2uHqKd4wN46@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|IA0PR12MB8256:EE_
x-ms-office365-filtering-correlation-id: 9b6307bc-7910-4c86-bffc-08dccbd4787d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WlFZT2VFVno2aDRqdDVRcjQvRlZDUVBoNzRhWmEvVDUvWEYyR1AvZkNCZ0tY?=
 =?utf-8?B?N1pySllnZVg4ZkRaUGtHQU55a0x6ZHlkYTdmRDBZejRsUGlLWThjenlaRS9T?=
 =?utf-8?B?V2RIWTQxU2RMWHc1MEhiV1ZFUmxqbG1QQ3crU2UwM3lIc2xuV01QTVhPK1Yr?=
 =?utf-8?B?M2ZkTnRYRjZLV244TTJ5SG5nNGwvR0NWaHJwWUpyL3Ezdkp2OWJyMWVpMk56?=
 =?utf-8?B?ZjAwcWtMVGFxTEVNN1BsSlh3cjdqWE9waC9US1lVbERzSmZsREJabUtqamJ5?=
 =?utf-8?B?RzBPWDQvQzBHdWtFNCtlODRDcUcvU2ZmVWk3TlVra3h1c21YNDg0TWxGLzZG?=
 =?utf-8?B?OFdiUjBPaUsvT2dKZ1orM3Mra3hUZHdEaEhWdW1sd0lmTURZRTZhS3QraDlq?=
 =?utf-8?B?Wm85dy9sSHVuNm43L1pnYnU4WGZGYWhuVktNeDVGaHI3bm4rdStMQTMrZ1M3?=
 =?utf-8?B?ZFdiN3VtRGxzMWpzR0xQYko5WXQrNi92TEN5cDQwTERXU0lqSXRjeUt1UmNE?=
 =?utf-8?B?bnZ5VnVLeTZHeDRlK0tVZWdjRE9odXkzNG1VZ1JGNDJMUFd5RXJhRGlWa24z?=
 =?utf-8?B?emQ3NkcyYjNUY2h6YXBvNjB6U2JhbnVmcWJpYlFWd05XaVZMZ3lGUTRGRFdX?=
 =?utf-8?B?QnJWeXZ5OUJvQ1JxblJFcWYyZUJ0ZWY1S3ZTM2U5eVo1WUxYdEtRdTBKTjdU?=
 =?utf-8?B?TzM2NTNBUzRKVklUYWJWQUVueXRrTXh3NUVocDNHbVhTM25UR3dTUjg4aEVC?=
 =?utf-8?B?K20vbUlpbkV5bjA1Tzgza3JXS1Bwcy9Gd0VhZ3hEblBDRVhaaWhsbzVpQysw?=
 =?utf-8?B?SUVHQ25JSkZ5dzNCMGlUSU9NWnBnM05pdTRPenFUZFFoSldDamxjbEE5K1Vu?=
 =?utf-8?B?bnNFdkpFSGZ4djBNaUQ4cUFiMGJYWlVxUlAzajUrbWdxUklYN0Ira2oyRHU5?=
 =?utf-8?B?UUtkY0tUSm9aNmpwL0tMNXRXRXJ4V05nRzF1SFpFemNBV3VnU0Q2ZHYzMzRn?=
 =?utf-8?B?U0lxcnpCR01WcDl1WHVoVm9lL1B5T0lpQ3lLVk5WK2dqVlhYd08wUEdKV0V2?=
 =?utf-8?B?SUlhaXpuNk41ZHFvQm9PVXp4a2xVMjJYVnc4QWV5QVBzTzhLenZyY0hsaEZ3?=
 =?utf-8?B?Z2pWK2p6T3Z3Q0N0a0NzUnI2OXpLN0RTdVh0NGlFNllBZ2FFTDNiOTNacm1o?=
 =?utf-8?B?R2JjRVhZSjNkMk5HUGcyVGR5eU1rOUgxK0h1aUNwb0w5Y0tublFUcDhybjN2?=
 =?utf-8?B?N015ZkdJK1VoeXVOME8yZmRkc3JyUWJWa052Vmhqc3Jsb2IxU3ZKVXhiTG9Y?=
 =?utf-8?B?Z21GOXpkK2EwMEZJNDFFd1RtNHNEN20yY3VDNVd6ajExakNTRnpkc3BvSm1v?=
 =?utf-8?B?WTF3ZytZUHdRV25vNTF6bHhzSlNUckhpb2graGtJMW9pNEJzNkF2NjFXSWVI?=
 =?utf-8?B?T3FRbG9WYXVlRjFqTG92V2dIR0pYVllqVEtINmRVVTNtVElhZEZMbVh4cjha?=
 =?utf-8?B?TUVVbkNjRVRqL3doNHJWclV0REdieGVkV0NiTldlYU41anFEL0hRdWdWeHRj?=
 =?utf-8?B?d1h0aS9QSS9PS0pYbitFYUJnU0tNaldNNldHQ1IxcCtMbmU1Z3RGQk1CeFZZ?=
 =?utf-8?B?aXdPUTNSWEVHQ2tOc0paWnEvYlhHRytNZkc1UUw0RlozSE1PL1liRWU3Wmw5?=
 =?utf-8?B?Q1FYa0dvTmFNZmpYNjJhZWJtZkpPVXNIaE4rZGVBQmJuY3h0UW14L2N4SGk5?=
 =?utf-8?B?ZUhZdFdLb3B3dHNIcWp1bG9uNWE1MWFVNms5eHhCMUNvb0o0T20zUDVJekN3?=
 =?utf-8?B?QWI3Nzh2K1pwcThsMCtIN1BzeXVKc0w5UE05cm03aGJaMVJabllHZ0I4bTFJ?=
 =?utf-8?B?dnUzSmYxeFhueUN2Rnh1ZS9ab21DTzRIQ1prOUJHOUg2RGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ty9SK082QXlwa0djUDY0ZmNUVDY4VmxSY002ZVluZGpNb3VzUUMrRWR4bWw1?=
 =?utf-8?B?SHpGa1FiakU1QXFkSjV5MUM1UVhkTmdwWU5jQ0Y0cTY2N29MUHVVVEF2WkRx?=
 =?utf-8?B?dlU0OXljclo5anJaQ2xJM3IzS1NGUWx1Q3Myenc1WW1Ga1pnT2xRc1kwQi85?=
 =?utf-8?B?MU5ndGYzVWdwenU1UE9LMTVRNmNHb0xEdXhWQWptSERaV3poUWtZN21qdHNv?=
 =?utf-8?B?cGROemNObTFCa2dhSkNWUzY5RzV4TVI4OGtCUWlDbnNUd2VaWFpoY1NmYkhD?=
 =?utf-8?B?Y3ZUMVRucmRlejE1Q0FvNlFrckE0NzlQVDRyZWFxMXdPQWpEeDgvRUwvMG8z?=
 =?utf-8?B?Y05BTFJmNFpQUERBb0RNZnVqUnBLc1gzN1lGSkNidXptQy9ZekVYT0hoakJF?=
 =?utf-8?B?ZzZxZGdGZ3VieVRzZEFIQ2M4aWYxOHJjZFdQRm12V0ZyemVUQ2IrSFNtb2NR?=
 =?utf-8?B?TGZFekVkS3RwWW5LOFVXQ0pxNHdSOXJYbExEVDNFTXFHOVdxbTY4UXk0RmU5?=
 =?utf-8?B?eDRMeUQ4eTBwejR2U1BTSUEvYW14WDRTVVRmRkRsY1lrN1VnOEFCbWlpUXp2?=
 =?utf-8?B?Sjl2MHg4YWU4WWx6b1ZiTnZNRGNUdzVDak5obGNPN0prY3RqRjl2OCtJT2w2?=
 =?utf-8?B?U1BKcFJqbnMxb2tTQi9aQ1k3akkzNUdKOGtvS09GbnZxWm5wbEFWNy8yZlkx?=
 =?utf-8?B?NGNZTmcvdjIzL29ncHdGRWgzRk0rK2hFaEV5UG9kY1RaZWxONXBVMk9XcXg2?=
 =?utf-8?B?cFlyc0pNOXF3OFdtRkg1b0VRNW1DOTlaMWF4bmhTT3pRamkzRUo5aGZZRXFT?=
 =?utf-8?B?eHJoWFd4QTN5Nks2TzVSMkEyVkg4NGhGdXVmQ0RwK2VvelA0OEQ4aEFMbDV1?=
 =?utf-8?B?RlJWQ1BpM0gzc1JEWDFJditqd3FSeGJTZFJ5Z3JUdFRUckZHTmppMmk4SVVE?=
 =?utf-8?B?VTQzSGNJYzhDdEZndWRueDFBZWI4WnhxYlg4WnFuWUs5ME9nRkZ3alZZb3E0?=
 =?utf-8?B?Q2pES2xRMFFETDRXSjNWVXgza2V5R3BJdWN5NVV4S291WWJGc2RmSm10Ymor?=
 =?utf-8?B?b3g0L1VmOVB5RnZMR3Y5dUVLMGowUmt1Sm9XbEVaNElZeENWZ1JrV3BwMjYw?=
 =?utf-8?B?OG9WSU81YXQvcUxjdFllOXlXNnM5TjNGcnk3N2cyR2ZkdHpIelJYTjIyQUxX?=
 =?utf-8?B?ZHBJS2MvWXByZmdjZXhvYU1vakZ3UERuTGRrenVzOGRnUmhqbW1FLysza0FZ?=
 =?utf-8?B?SDBMZGpIWUVUTVEyai9LVURTZnh6bnVQYUc0UkVEM3VjSm5ERHJWeHdlblBW?=
 =?utf-8?B?bkQxbjJDTlRHS2FSOEwvZ0pDdkp2Zk5xdlhTR2VZNGwxU2tZMjJtR0tYa0V2?=
 =?utf-8?B?V29QMG5DbVl1SG5JQ3Jib1hUaVQxbkJ0OVBveHZ0R3NGM0s2T1J3SzZUZnds?=
 =?utf-8?B?dzB2d2ZneTJNK29oazl1MlpqK1pnZFlYOXFJSWhpRHRnYUtybi91dDlFRHZY?=
 =?utf-8?B?T2lUcWxZN0tKaDh6dHhvVmFyc2hKWUQ0RWlORUhydDArd2VieTI5VnZNaSs3?=
 =?utf-8?B?TmtLcURKQkFlUTV4a3M4UWpvczJBcW5GRzZjQUlBYTZ6WndENjZEVXlpT1di?=
 =?utf-8?B?QlpRUkhqVVpSMW92MCs4RHcxQzlkazFCUUQzMTdMY0hYQ1NHWFp0V0RZVklV?=
 =?utf-8?B?WCtudzdoa2pyU0pFRVdqeWxnZzF1R05rT2VyQWgzR0luVmhxSUlQMmdkZENR?=
 =?utf-8?B?d294OEJwZFJQa1k2NWh5L0FtQU9ZdGlzUkUrMUZueEpNWXFJVGRVQ0pJM2JQ?=
 =?utf-8?B?aXM2cXNWSDV6RzNLendZejlLbU5kMnJ2WVM3aGJJYWc5cnY0NnZBbHg4WFZy?=
 =?utf-8?B?OE1sb3R4b3NzY3Zubm5LRzMzWG5oNkR5eG4raU5Ha3NyN3RTNHJ2ZGpCRVc0?=
 =?utf-8?B?ZHJUVkc4bEVSVjJKUTEyRXdSQ1FFU2owV1FtTFBMekdsU2VpeXNGSnhyYStQ?=
 =?utf-8?B?YWJvdjJuTGdHdHJUek5rNDBqMzc5VjZOV1ZLdkJnZUF5U2pvbGpDUllPQXE3?=
 =?utf-8?B?VkwxeTdia05UVnVxdUk3RHdMYnBneHVleFgwbzhQTFNtL2taRjZjQXJ3Z3c0?=
 =?utf-8?B?QnhxcHNwNzQrWFpNcnhyVk5TZWtCTkVva3RCSUp0N3h6bW1rOFdZSjNSU2tY?=
 =?utf-8?Q?XZAc7eVzZnCCiR1m8m+VTFLacwJhl0eqWG//YO2c8jLF?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6307bc-7910-4c86-bffc-08dccbd4787d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 04:54:19.4189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3pDwHIKSf7hQYAPSbU1UkQVADJxuo0MfWbyY+6yhH2CqCK6Taq7g/cUGxkl3mNJ4mUikd4GknE6puZEsIcCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256

DQo+IEZyb206IHRhbi5odUB6dGUuY29tLmNuIDx0YW4uaHVAenRlLmNvbS5jbj4gDQo+IFNlbnQ6
IE1vbmRheSwgU2VwdGVtYmVyIDIsIDIwMjQgNzoxMCBQTQ0KDQo+IFBpbmfvvIxOZWVkIHNvbWUg
Y29tbWVudHMuDQo+IFBUQUwsIHRoYW5rcyENCg0KTWVtb3J5IGJhcnJpZXJzIGluIHRoZSBob3N0
IGFyZSBleHBlbnNpdmUgYXMgd2VsbCB3aGVuIGRvbmUgb24gZXZlcnkgZGVzY3JpcHRvciB3cml0
ZSBvbiBub24geDg2XzY0IHBsYXRmb3JtLg0KT25lIHdheSB0byBtZWFzdXJlIGl0cyBjb3N0IGlz
LCB3aXRob3V0IGludHJvZHVjaW5nIHRoaXMgZmVhdHVyZSBiaXQsIGp1c3QgYWRkIHRoZSBiYXJy
aWVyIHlvdSBwcm9wb3NlZCBoZXJlLg0KQW5kIGdhdGhlciBzb21lIG1hdHJpYy4NCk9yIHBvc3Np
Ymx5IHVzZSB0aGUgc2luZ2xlIGRlc2NyaXB0b3IgcGt0IHJhdGUgdGVzdCB0byBzZWUgdGhlIGNv
c3Qgb2YgaXQuDQoNCldlIHNob3VsZCBhdm9pZCBiYXJyaWVyIG9uIGVhY2ggZGVzY3JpcHRvciB3
cml0ZS4NCkluIExpbnV4IGtlcm5lbCBuZXRkZXYgc3RhY2sgdGhlcmUgZm9yIHRoZSB0eCwgdGhl
cmUgaXMgYW4gb3B0aW9uIHRvIGlzc3VlIHNrYnMgaW4gdGhlIGJhdGNoLg0KRG9u4oCZdCBoYXZl
IHRoZSByZWZlcmVuY2VzIGhhbmR5LCBidXQgc3VjaCBzY2hlbWUgYWxzbyByZWR1Y2VzIGJhcnJp
ZXIgcGVyIHBhY2tldCAod2hlbiB0aGVyZSBpcyBvbmx5IHNpbmdsZSBkZXNjIHBlciBwYWNrZXQp
IGFuZCBpZiB0aGVyZSBpcyBiYXRjaCBtb2RlLg0KDQpIYXZlIHlvdSBleHBsb3JlZCB0aGUgZHJp
dmVyIG5vdGlmaWNhdGlvbnMgc2VjdGlvbiwgd2hpY2ggaW5kaWNhdGVzIG5leHRfb2ZmIGluIHRo
ZSBkb29yYmVsbD8NClRoaXMgY2FuIGJlIGhlbHBmdWwgZm9yIHRoZSBkZXZpY2UgdG8gbm90IERN
QSBhIGJhdGNoIG9mIGRlc2NyaXB0b3IgbmV4dF9vZmYgaXMgbm90IHVwZGF0ZWQgZm9yIHRoZSBs
YXN0IGJhdGNoIChiZWNhdXNlIHRoZSBmaXJzdCBkZXNjcmlwdG9yIGlzIG5vdCB3cml0dGVuKS4N
ClRoZSBkZXZpY2Ugd2lsbCBwaWNrIHRoaXMgZGVzYyBjaGFpbiBpbiBuZXh0IHJvdW5kLg0KDQo=
