Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB02566F4
	for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735561; cv=fail; b=or4QmjeON6xoa0N0ogeaNM4FWeKJwnE6olN03F0UfMWHZX7itMBl+IsJrfuGO8b20NKEqd9KCwbuiJ3wOAMUJahS1SJoSyILr5rTEonCU+3pvH7y8HaZXJn07FG6zT0s+AyGRjoFNJb/Nc6jOnxUbKiF5G8lXRx6mcAmp3/0ck8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735561; c=relaxed/simple;
	bh=FkSbyjM1EfDtqYTGqaTbLTvu3SzGgjU2sBFhV+91yhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rMgt/kSzmEQwSFBstTeyzWTY0+1dlW9oTdgqAW2dPXNcnLaM6KynDQt2qcjc/KeRq6k2r5heqfyCCOSG+I/g8pNkravQVrA/yzG7zLJD3RWCcXnt1rooXQmoonWImH+Om4nnPJ4bR8/Xeuw7jo/utuJ9j7zLi3DlLK6bCfQVS6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mTJCWe3w; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTJCWe3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEwPJIEw66ACmotFGs+c4LiFC1xZ0uxMA8xz4iVO8DJ/E+RqLoN5DJ46Wkft8+B6oH5xAnkTMvbnrO7BfQ76ciRUK6cr/HwGeOFxT0Nw25pj9n+B49anNRMwgbjJOeUUU4GCG2VcyI7zo6gFNpzMUxghJwlqTk2QS6Uw8jqZ6B+FJKQbI8Lu4BqY/MjWI68yDjF0vAx5NroY4CR85OBtTdPJOHRL2ax6uPozjm2+KTQVtOyheT+wf0dsP2M14iP2TPmLuNSxOIvCoMWf+Nwm5W7Alo9tVSZAD55yisz9/XORMGZ+Df0iAiPDhabY8qQmMk4J2zIOS1g28l0YRzWl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkSbyjM1EfDtqYTGqaTbLTvu3SzGgjU2sBFhV+91yhc=;
 b=YtlJ+IYxAnaKd8afBtFT190Sk4It/2xA82YhjJQY8fcwp2dza8uAj8rPkzARewpBcgQimmfbHMayyZKAXxvgF+LdoINm/LUW4zNiaBhVvyh2CxNA5Rel74HyG8t2NMd6s7Ee7ev9FXwZq51bPZH562NxQRjJx/w+f9w91CJRu7hOfRk9AUSZrWjhcLKWlZNUq2uScX07Z4lL6tRmgYVW+CO+iZrj65L7iXRh5YxbDEMmZiJC44BuM9V/MFLb5pkO/dLfPVxT12pKVLAtGfWlJtCtRRArJTMzaIj5477tVMX72G/AAfvLh6iiKe67xLIRu4eU4eN18Z+0oREG+3D1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkSbyjM1EfDtqYTGqaTbLTvu3SzGgjU2sBFhV+91yhc=;
 b=mTJCWe3wQ0R+LFbk568KEf46n0KJYG9tPWxO9ITMVvmyg7TAnBH/F4VYxEAItNW4ZE+oZ8F2u3Kknai88uywxNgMctuW3l94hz3QRakJdDVylHOHKRC0eSa8sNpOOkz+skW6O6B+0K2+IKycuKDB3QuumdiHvPaEmhPSRZ43tDdNNvLpxCpd6UxSu8QcV4c201AXn1hJeIuOgLazxBc8X77gPcr7OaMPVwTreLtCGclEqovfCuiBXxYWSbQZQDjomnnpNq5YGRhyVbGDrgQ9nNbXsXfHgZea8nmPH3GkSQ7CKcCLbrBpAytuE13Zo5R15djDmoItw+On7LMV89aUXA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Fri, 28 Feb
 2025 09:39:13 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 09:39:13 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: Shiva Shankar Kommula <kshankar@marvell.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Nithin
 Kumar Dabilpuram <ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
	Rahul Bhansali <rbhansali@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Topic: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Index:
 AQHbgWDwSYToX/CSwkOk56bKWmWaZLNN+nsAgAA074CAAUF3gIAHVNKAgAJdsACAAdORgIAAB1SQgAFyLYCAABW7cA==
Date: Fri, 28 Feb 2025 09:39:13 +0000
Message-ID:
 <CY8PR12MB7195A6AF597D4A78E8FB540DDCCC2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250217172509.107212-1-kshankar@marvell.com>
 <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
 <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
 <CACGkMEuUsQuQ5zNu=kqdTQ9-zWsNc3zdFYVre03fuNnE6tKjog@mail.gmail.com>
 <DM4PR18MB42695063456CE2F746EEDB0BDFCD2@DM4PR18MB4269.namprd18.prod.outlook.com>
 <CY8PR12MB7195255494ABF756FE5414FCDCCD2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CACGkMEuhgb2TOwJmxOzy7yQTwY65WCJ=88s9bBj4oN+WQGzvEQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEuhgb2TOwJmxOzy7yQTwY65WCJ=88s9bBj4oN+WQGzvEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN0PR12MB6199:EE_
x-ms-office365-filtering-correlation-id: 97202281-bd3f-4bce-91b0-08dd57dbc29b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2FENmh5TVVjK3RiQWhJbmtIM0YrVWlkdld3eWw5VnE5bzloVnRtYWpUcGxw?=
 =?utf-8?B?VE01ZGY1c2o0NStVc1hCellORmRyTmhjbEY1QytKaThOZWpaellaK3RSZ2Fl?=
 =?utf-8?B?c21MMGdsNVJ2YUFuQU5qcUpocGdnY2Uzc1hlNnltaVUwRmJyWktYcUJoTnlW?=
 =?utf-8?B?Uy9RNUtXUm1iZ3BUQ3VaYkNjelA3SGtVOFZ0VHpyNVJGaWNZMERXc2JyeGk1?=
 =?utf-8?B?MGhWMktMS3FIL1FqcFNIam45YUxHRHlYN0FVOGRFZVc1N3ZWV0VlZ1U5cm1G?=
 =?utf-8?B?c1E5MjlOdDlCRWE1eUxzb2tOdmJ4aFZ2Vlh2ek1rT2ZuLzZXMTNRaEVPcFZj?=
 =?utf-8?B?VVVEbnhvNUZ2SXBWdlhqcGdmbmt0angxeWlhUGxqQ2IvcWJ2RXM1SER5elk1?=
 =?utf-8?B?L0VyMUVYMi93eXR5aWhBUU0wVGVyOHJDNlc0NVpWMWIxMFJoOE96MCtqSmNT?=
 =?utf-8?B?eE9RdEJ5U1RQdi9lTGNGeXdIYUlhWXpmd252M0IwWTdzTmp4RHdML3NpV1Ir?=
 =?utf-8?B?aDFBRlI5azNUQzdGeFQ3enZEaEpaZlhlZExqMlNrbXdQM1c2a2pRY0w0RnFZ?=
 =?utf-8?B?NDhYaXJRcmhEZDNIT1ppVGFsZyt5RkwvRmd0MkZ1STdCalFTdzRSaXFnd0FK?=
 =?utf-8?B?Tk10ZU95TlFLaWFJRllJL0RKM2ErZG1lS2dxYTdHTjNiN0ZQWEhYajhYRG9Q?=
 =?utf-8?B?Mk1mZCt6aVhhQmVHT1NFbnM2Wk5OQVBZSEpJdTlZSHVaK25nZnFHVVNzeCs4?=
 =?utf-8?B?end4SGxoUEFWc1lFazJEMXlvb1Arelh2QzJ5M2RPYWZtRmxzS1UwTVM5YTVK?=
 =?utf-8?B?OHpWMXBTQXByNkI1TzlXMzYvOEVCMVB5OTZ2SXczRnUzeG1DenZQL2Y5THk1?=
 =?utf-8?B?QllsVFQ3a2gzTXVCVXZZU1d3NmhGR2pJeXplTzF5OWlHMlF3NDN0bG1xZmtN?=
 =?utf-8?B?T21xRGE3ajZUT0dhWEJlZW14WjZsR2hRT1c0ZnQrMVBLbjh5VDh1WlpTNUt1?=
 =?utf-8?B?SXNFd0Y0TmptcTIzTm1OY1ZnSWxVT3FxYVZ1a2ltRlpNOFU5KzFMczRaZGYv?=
 =?utf-8?B?dHZkSmxHNEdSZEJFaGo3ZWNUSk5ORTAwRHl6ZzF2SEpzYWk0TU5MZFRibCtM?=
 =?utf-8?B?U3hSd2Mzd3NKSy9CK2lkZFFUcTlZcUpDbU1QYklzOVFGTU1kWlZmVFJadzNB?=
 =?utf-8?B?ZEpFYy9PZ1RLZDlFM2M3cEpSR0plRC9MUElsVVF3Q0VmNU12VHl3TC9kS0U2?=
 =?utf-8?B?MmNHSXVjSFZFT1FjdjNLTWtEMTVmL3NHejZSYVVLYVp6ckd0UHFiM2FaODNs?=
 =?utf-8?B?RGRxUzVaVHhNNFFKOXM4dXhiR1BUZnRtblpubG9JOWFHb0VHV2FjbHBiOVFl?=
 =?utf-8?B?cVlTOGlaeWlBd2hJT3o5SVFFblNiTzBxSE5xVWJOb1R4aWZNZDR2cXBDKzd0?=
 =?utf-8?B?WDF6MnJONzhRVWlhMmVnS2p3UjNUckVJYUsycVpmTlRZSGR2S21GeDdWVlJW?=
 =?utf-8?B?aktPdUlzMUpzWnFvcEJ2VXFTODYyWE51N3YyRi95Smg4NFZObWEvQ1UrRllu?=
 =?utf-8?B?eTdSVzNSVW5XN3dQQWlLNnFDaWFqTnRFWGJJU1lNdGIzOHpWOE1BM0VMRzRZ?=
 =?utf-8?B?T3lab0tqN0pkV1N1UnJEb1FKeVgrdmltTFQ4OWFPUHpOQWhuSEZXYXpTTUFx?=
 =?utf-8?B?d0lMR0V3eDdndEpsM05vd1drTi9SUHRaaURNczJMdlFISjY5T2V3SDNBdzFq?=
 =?utf-8?B?Q0lzUHRpMnc4ZlNRRVpTNFFMQmttREFOV1FuYTB3K0VFS21Pb1QyWWZFdjIx?=
 =?utf-8?B?dzJQNmU0MElCbHNNNndlSnRHSEN0dWhIZkJHRXdkRm5FdFFwRk5Bbk5Ic1Qv?=
 =?utf-8?B?YTRCczV0RVB2eUw1M2NreHFsT3cvQmF4bHJrcnpKd2JycFVrWEdYY2hqYkxT?=
 =?utf-8?Q?Y4Yl69ENwtTDWgb5fLRPQoVznZI6niLW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnRzcVo4ZjVXME1JWnFzbE1JdFZWaWpHRUtmMFlrWjFTbHQrNi9oK25RajZD?=
 =?utf-8?B?dGY0RzM3d21yMnYzbzByblE5VzU0QXk5M2c0b0YrTU1jNmh4WmNtaWNKbitD?=
 =?utf-8?B?dHRnY3NKUSszOXVJOEV5ZW8yMWZTbDZYcmdpUHMzN2lvMG50Vk1iMWk2eGRw?=
 =?utf-8?B?UnZ4UWVlblV0aUhQL2pIMFFzK2VpQ2ltUTNrSFphN1R3YVg4Q0pHSzdhQzFp?=
 =?utf-8?B?UTJ5cnZMM2ZyaFFxR3YxTVhWUTlQUDRwVkVCTHdackZ5ZHRUV1dZOFFzZits?=
 =?utf-8?B?UXRmK2RVUzBGTUkrdzZLMmwycDJlRXJXVnl4SFkrUmgzd2hzQk1ldU5aNk83?=
 =?utf-8?B?Q1R4ZlpyWWhCYWlFZ1hzbk0yN0FmSUZpSjI5dzJwaHVJM1VZUC9HaWNsK1Jq?=
 =?utf-8?B?R25jczJCSThTTVVic3o3Q3pUL3dOM0gwcFZTS3QwMmF3WVIxYWtaTTQraG5T?=
 =?utf-8?B?ZnNpdll6LzdHOEF4QUpBOC9hZ1JWVEtVUllBU3BkZW1BVytMQTF0OS9QR0Fh?=
 =?utf-8?B?VFlBTGVoQVFXYnd0Nm56UmZlUk5TTEVKdGZheFNPREZGRU12dmRMUzdCR1Rm?=
 =?utf-8?B?R2IrQzZuV1BnMVZJaG5qVGxvcmo4NHZ0SzlldmlEaDh6ak1Va1YzL0g5bFZy?=
 =?utf-8?B?RG51RHdJdTlvS09rQXIreStuV1JTR0NxMkpRdjZKN2ZjcXhrTlo1ZHYrcTRO?=
 =?utf-8?B?aW5Pb2hBZGZUdGl0aVVJZnVYdGpoUmxLMUZ1QnZzZEJRajZTQjJqMTZLM09i?=
 =?utf-8?B?VnJ0b0JadlBnV1JTMXFHTVArZ0p1dUNkajFYM01RZFVUWTVVcUdJUEVJeWtn?=
 =?utf-8?B?MFVMRWo0TVhNZWVZd3E4MWg5a2E4RWl4Tys4aFhLU0dzU2JsSGxsak1qdzcv?=
 =?utf-8?B?a29Ec1Q5Y0ExRGZWSjFnU092QitaL2JKRnpON1E3eUN6STZSK1UxMlZzbTR4?=
 =?utf-8?B?Rk9YdVlMVW1GRXZheHdZY3JSaHB5UnFFQVhONkROZ2s1UStoa1dmSXhoS2k2?=
 =?utf-8?B?RWdNbjRrM0sxLytuS21qUEphSS9WQ041Y3NsNXJFU3BLY2RYS3ZNNWNiK2ly?=
 =?utf-8?B?OFZOYWd0TTJxTi9vbHF2N0pwNWpLOTRpVmw5UlNxTzZiTFU4MnRyeVlieGNz?=
 =?utf-8?B?WjM4RC9wRkk4VlRSZXM0L1VZUUgyT25mWStZclU5RHBwVEVUVDZZR1ZFWlpW?=
 =?utf-8?B?TzM1Vll1NUdNVHBDYStRbSsweHlDLzl0QlJOTTNBN3ZHUWFoMDFNUjU0M1NJ?=
 =?utf-8?B?YVkzVGpYUHJpeXpNS2EzRnZzNFpWYmtlc3czeWtqbDExaEptd3Y0NUJWZStr?=
 =?utf-8?B?cUJ6a2JtOGM1NHdIbWdNOFJ5Ylp3b0NkcmdzdHlXUFBBQ3ZreTNGc1JiTFUw?=
 =?utf-8?B?MGRXbENrMkltNzFtQWt1UkRqZTNMSFhQVTF5czdMVU1JT0FxVUo0UkFYSUpJ?=
 =?utf-8?B?Mm5QMmR1ZjNoTXp2akxzM093Tzd6UnJUZWlIaUxkS0RXdGN2enNHUlJUZGtD?=
 =?utf-8?B?STRScDExZllpSjQxa0ZZQzF0Q044U3FnSmVHblhwUGVIZklRRlBVSXYzbzlY?=
 =?utf-8?B?ZHZ3b3dCamtDNXR1V21QUGRKdnE1OTh6eVFDdVlEN1o1OVdmYnFnajFIdzFW?=
 =?utf-8?B?NG95ZkwvSXZLTWFDc1ZpUEdiRWhzNlhpZnQyTUdvYnFEN0tsNzJvSEl0Ynk2?=
 =?utf-8?B?V3FnK1ZnNUU4ZjRzaW55RWRZWTVOaGp3TGtpMmVpemEyWU1BS01aeWtpK29Q?=
 =?utf-8?B?ck8vdUVzY09HT0U1amU3ZmY0ZC9VQlZnM0J2R0tycFZPN3VGNkZWbHp3c1dB?=
 =?utf-8?B?SGc5K1h6b3EvZ2FqRmE2TDJOeFU0NVk2RkVFbWl4MlNBSzVET2Fua2Zod3Zp?=
 =?utf-8?B?bUtIak4yTTQ0SlA2dHhEOFAvVnlLblpnK2Q5V3djTWp3bEFKckZGT0FJY0xj?=
 =?utf-8?B?bU0xYlpFZitBbnJoL2dhMHBFNFRiVlFIRkM1UmRZZFF0UE4vM1ZGdmNGbCtS?=
 =?utf-8?B?Tm1KOFZBT0dlYWJQZmF3bERQakRlbWdYVHlGVDVkMWNCYk9zRzhkL1pxdjhN?=
 =?utf-8?B?T1F4N0U1WU9TSkFmdHRNUWwxTktLdzlYcGF1aHptOHgreGpDQ3pZb20xczNR?=
 =?utf-8?Q?TDOE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97202281-bd3f-4bce-91b0-08dd57dbc29b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 09:39:13.0276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mNca8lrtYaLZRm3O5xgYkPmTiE5U/VOULZsM7gFVbsxOh6SiwcuXHQafIoIwMUd5JS8DqIEDtuhCllH3l+E8Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBGZWJydWFyeSAyOCwgMjAyNSAxOjUwIFBNDQo+IA0KPiBPbiBUaHUsIEZlYiAyNywgMjAy
NSBhdCA2OjIw4oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4gPiBGcm9tOiBTaGl2YSBTaGFua2FyIEtvbW11bGEgPGtzaGFua2FyQG1hcnZl
bGwuY29tPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDI3LCAyMDI1IDM6MTkgUE0N
Cj4gPg0KPiA+ID4gPiBOZXcgZmllbGRzIHdlcmUgYWRkZWQgd2hlbiBuZXcgZmVhdHVyZXMgd2Vy
ZSBhZGRlZC4gSXQgZG9lc24ndA0KPiA+ID4gPiBoYXJtIHRvbyBtdWNoIGFzIGxvbmcgYXMgaXQg
ZG9lc24ndCBjb3N0IG1vcmUgdGhhbiBvbmUgY2FjaGVsaW5lLg0KPiA+IEhhdmUgeW91IGNvbnNp
ZGVyZWQgdG8gaGF2aW5nIGZpeGVkIHZuZXQgaGVhZGVyIG9mIDY0QiBzaXplIGZvciB0aGlzICsg
YW55DQo+IG5ldyBmaWVsZHM/DQo+IA0KPiBZZXMsIHRoaXMgc2hvdWxkIHdvcmsgKG9yIGV2ZW4g
dGhlIHZuZXQgaGVhZGVyIGxlbmd0aCBjb3VsZCBiZSBuZWdvdGlhdGVkIHRvDQo+IG1hdGNoIHRo
ZSBjYWNoZSBsaW5lIHNpemUpLg0KPg0KT2suDQpOZWdvdGlhdGlvbiBuZWVkcyBlYXJseSBhZG1p
biBxdWV1ZSBpbnRlcmZhY2UgcGF0Y2ggdGhhdCBJIGhhcyBiZWVuIHBlbmRpbmcgZm9yIGEgd2hp
bGUgbm93Lg0KTGV0IG1lIHJldmlzZSB0aGF0Lg0KIA0KPiA+IFRoaXMgZWxpbWluYXRlcyB0aGUg
ZXhpc3RpbmcgcHJvYmxlbSB3aGVyZSBhIHBhcnRpYWwgY2FjaGUgbGluZSBjYW4gYmUNCj4gd3Jp
dHRlbiBmb3IgdGhlIHZuZXQgaGVhZGVyIG9uIHJ4IHBhdGguDQo+ID4gQmVjYXVzZSB0aGUgZGF0
YSBpcyB0eXBpY2FsbHkgd3JpdHRlbiBieSBvbmUgRE1BIGFuZCB2bmV0IGhlYWRlciBhcyBzZWNv
bmQNCj4gRE1BIGFzIHRoZXkgb3JpZ2luYXRlIGZyb20gZGlmZmVyZW50IHNvdXJjZXMgd2l0aGlu
IHRoZSBkZXZpY2UuDQo+ID4gQSBkZXZpY2UgY2FuIGFsd2F5cyBkbyBzaW5nbGUgRE1BIHRvbyB0
byBhdm9pZCBwYXJ0aWFsIGNhY2hlIGxpbmUgd3JpdGUgYnV0DQo+IGl0IGRvZXMgbm90IHNlZW0g
cHJhY3RpY2FsIGVub3VnaC4NCj4gDQo+IFJpZ2h0LiBCdXQgSSBtZWFudCBpdCBuZWVkcyB0byBi
ZSBhZGRyZXNzZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4gDQpTb3VuZHMgZ29vZC4NClRoYW5r
cw0KDQo+IFRoYW5rcw0KDQo=
