Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D215C15F
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982824; cv=fail; b=XG8QIPFx46RPjtlAcqQxp6+BIwRLIDseehKSHZ376C3t7H570olWkMVwIKymIf84A/irhSsce7clQOENnW2+J/yqjEWZk8VGTrzpMRRDjdd41sl4hYo1jV0+fvzfUDj3aPmW0+ovDrtzlBsfWItB/9kM0Q1NZyDz7OrIc04zEK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982824; c=relaxed/simple;
	bh=paZoHwSYXLd/EJWwHqOIZA3HxWEK6U/FIEEOMMOtiYI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E8bqQZ9IFPcbaurJkH2AGD71WNUIIUc5Oq954p4B3bTVB1ypo3FvZOmEGwxO1stnjS912OP68AqGb8kXQGX9gZLYnQ8FlNGJRDz66ctcidMpD5YqP2TgdPkQZEoTIGRbwmrKR8zfr4klES5toJk/TnrFDt18ABndsnbyPKNzZP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=I/nKNwHJ; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="I/nKNwHJ"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q5TAWA005735;
	Wed, 26 Mar 2025 02:53:35 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45mbfj8e9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx0dV+0rjHJH16eNrILzyBa7pCR2DIi8cGI9i2ntuQIQaRWO99D4qikrIEKwKtZg1b5XnP9/MRcmj7so6haMFmiuQiYKeQ+E3+GR+NDqAyEDg6ZGsVCYbNSMmDJ5TdKBAQA/GuIivN9+X6fHGk8xpYvmzsK3a2o6sfz8PCGHNJnj1kFCg/zGmAE7HVjtXNI3CnQTVDPS5vmrMSMLzihxsyx1AlFg8amDzptbtXMPYYqtds/vY3xPnH1fsxYIT0gghSlBF42IBbhzwkHCKjBfSPcKZHzG1Y+d9fVPiNr+GKbqt1aYeuhFrJaXElFX8cNsnVJiRrAS+qEXmNopEl+nxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paZoHwSYXLd/EJWwHqOIZA3HxWEK6U/FIEEOMMOtiYI=;
 b=Fz1BaQ4qLbkkxW6YUCV/sSM/TZ41W5MaIje+8T3Vn6P219hNhb5BgTJ8Zj0qVFSkH+gkbjhI16T3DVk0cyTxNMi2WcjCWWUlR1XqWB2p6kn9gfdUZ+BuDLuWmz2SWdbvp4jAb+FRF4DKqnrxzHzqxyklUcBvf06rhuZl0zRQ3YR3sCRsINZxVbSx07gKtnArCpFiZFts3Myuyh6lVR2yCEP378Vr6J75icYb0yUb5ZviJNH2+Hf/043w/AB003KiTSRbjkzqYvji2vsWk7leZK/wGJdzXOJ87kzVDsIf+LByW5MjcD0Bsdi2SinNwwxe1j/59Gu9blKyX6tDBje6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paZoHwSYXLd/EJWwHqOIZA3HxWEK6U/FIEEOMMOtiYI=;
 b=I/nKNwHJPA6XIg37HQY8l7wfWOyLnmybL6FRwNrK8ztpvBQp9dMSMq/hb71pm5Pogd8KQ/KCk8/RJm1GYBbBaLu5hJCSTGzhQANiPyHZQomMvbkO5aGJw3eMFHr22/9SXzgMjeNCZYcPMXnvtBAJmGhq3xA8Z/fkzi0WcKyJE9M=
Received: from DS0PR18MB5368.namprd18.prod.outlook.com (2603:10b6:8:12f::17)
 by DS4PPFECE6388CD.namprd18.prod.outlook.com (2603:10b6:f:fc00::ace) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 09:53:33 +0000
Received: from DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac]) by DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac%4]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 09:53:32 +0000
From: Srujana Challa <schalla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>,
        "pabeni@redhat.com"
	<pabeni@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        Satananda
 Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>
Subject: RE: [PATCH RFC v2 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Topic: [PATCH RFC v2 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Index: AQHbbJXxIKzfYWOH2UaIl2cwocL1VLNCpL2AgELl8lA=
Date: Wed, 26 Mar 2025 09:53:32 +0000
Message-ID:
 <DS0PR18MB53683B7F3C7B546C3E17748DA0A62@DS0PR18MB5368.namprd18.prod.outlook.com>
References: <20250122062144.266725-1-schalla@marvell.com>
 <20250122062144.266725-3-schalla@marvell.com>
 <CY8PR12MB7195A7DF812EB2E46932BF68DCFD2@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195A7DF812EB2E46932BF68DCFD2@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR18MB5368:EE_|DS4PPFECE6388CD:EE_
x-ms-office365-filtering-correlation-id: 6d8ff66a-6b33-4f92-1ba0-08dd6c4c11c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0ExbWNqNGE2RldPS3JlWlpac0VtSG9rWGt0a2JEaUJkWXVjdzM3cDArWnho?=
 =?utf-8?B?S1YzRExISEFpWkZLczh4aDNXZEFKTUJtTm1sUVhzWitGcjBpNTBGRWVIRStT?=
 =?utf-8?B?SXVzSFZ6L3dyYjZrOGJ5VE8xVnY1YksxaHpVOXh1SzZocHJ0R0IxUGg4V29j?=
 =?utf-8?B?VmFTZ2ZqK1RZQ01UYSt4N3NFSzMrNFVFY2VSdkEzbit6NDFsdFVWa3NJdita?=
 =?utf-8?B?Njl1RGlTUHdFcG82d3kwYzZQZytTQk1lV2I2Nzd6N21QTEZkMGxLNGlCL2FQ?=
 =?utf-8?B?VXhyRTRGYVJ3RDZvTEUvak5mb3IyU1h6SXVsZm56elhrWE5HbkZsYzRKNEpI?=
 =?utf-8?B?cnZWY2FOdkNaeG9MTzBsdDNvYzVPSi9rYkZLME1Wc1FRa2kwbmxzLzA2c3k2?=
 =?utf-8?B?bFJvZGlVeWVSYWxHd01lQ3VXR1d6TXo3cWlTYkhyYURaYjVXTXBEUFVjVG9s?=
 =?utf-8?B?Z3RCL05UNEsxeVFIM25aeXMzNHREZnZaNVhsQzNTUi82YnlhUk0vOWUydVhZ?=
 =?utf-8?B?SmxZWUhWTkJmZ3JXWk5kR3NRNlBROTNxcmpBSHpOWnZxb2swWGZseC8vdytt?=
 =?utf-8?B?V0FITWV5Znl3cW9UM1dySExST0s0UVJFbEFPd3FBVVVkUGtzZXBlWC9BS1hj?=
 =?utf-8?B?NzhhNXFTQ3dha002WFlMQkRCeGJtcWpXTkxwa1hod3BrUHlJU3lLSW8wYm5i?=
 =?utf-8?B?NStxQnhwMjl3N3U4a1dYVUVCQ2h2cy96Nzlad0ZJNnh5ZHI3WkJ3bFM2Wm5T?=
 =?utf-8?B?RUJ4Um4zQXRBUHZQRE9ZQ3dVaXNhS1FkcnU4Sk1PRkE0cE9zR2xCa01jeXpu?=
 =?utf-8?B?SFlWN3FaUTNSa1ROY1R0ZXplQ1IydDduZDFUTnBOSFhpWVVTamJwOXZwWUhk?=
 =?utf-8?B?TkdwbGN3RmtiOHNWUm5RRDRhQ2lMbFpjQ1ZvNDlBcDl4Q09jaldWeWd4WlR5?=
 =?utf-8?B?OWVBRVJOWFIrS0xCcVdTdXRFV0lqL1BNQkVGRElYRzRuS1RTM25tV203VCtE?=
 =?utf-8?B?MEd6aDJOMmwyWEFKU1gyKzB1RWlWQjFVejVva1N0Y1A3dkpoRnBJSGNjRXBV?=
 =?utf-8?B?UVRpTVRjOHlWYXNYWC9oY05GZjhjQ0c2bHdRZDYyOG1WbkFmUllyS2xzNExE?=
 =?utf-8?B?OWxzcjZNd0d1TG00M2NFOUxFVWhVcGV1UXhHWDNmVHFoME1Nc05YOG95bHVy?=
 =?utf-8?B?c2FmVnRZclZlcGRQSnZXWlRsR1ljYXRJdzh1Sk1CcFp6K3NlaFNaVkVpQmdV?=
 =?utf-8?B?dll0K0FjSkluTEJZWjl2MlI0cHBNMWFWTUF0a2RtcXY2VkZ6d2ZmTTl6dHA0?=
 =?utf-8?B?eHJKQkZScEhsZk8va1FtV0NxQjRUS0lMMVNEdWpyUDR2UUlZM1U2ZFh2Qm9a?=
 =?utf-8?B?V095WmlDbWhtbGVwSG5UL0J2cEt3SVJybWtEK0ZScjM1Z1JmSVovZzJaa1I4?=
 =?utf-8?B?blpFT1B5MjV3V3ppakxYNHdmQzVxcC9TVk53KzkrRnEzVldIUXlrOTd1N2lC?=
 =?utf-8?B?bmI1ckJWQkhOczR6b2RzOXJkNkQxVUZwM0lPaHd0WE45SzQvanczRURVWG8x?=
 =?utf-8?B?bUM1MEFlVnpHU1FuNWR3U0llOXNrK1BGQkYwTSttM3ZOMkJFT0RVK0xncUdN?=
 =?utf-8?B?dC9JOUdPZzlrdU1WZEVMeUJyNFJtdjcyWG13bVoyTmx0N3J4REs0MmVON28v?=
 =?utf-8?B?Q28zc1paZVZTamMxOCt2YXFTK2F3Q0pmTldPU05tR0Z4NGxpQmowWTdSTEhL?=
 =?utf-8?B?ajVtMTdOVXRub25NTUEwem1XRWlPalVSZUFibUNpbkFjZW5pR3RIN21Ta1Np?=
 =?utf-8?B?akhjOW52QzhCQ09IN0VtcVAzaERleWppV0FuSTBnckFScVFTeXc1T0U0MEZn?=
 =?utf-8?B?R0xEL2dHejBtdlVRSTRzeGlwenZ2ZEtKWlcvVFdZSDF0VnlPY2g1WTNRaW43?=
 =?utf-8?Q?FflYsluUvDdVqS5XPiGNPr0JBwjZGP3T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR18MB5368.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFo0OGkvTGplckNjZmxQVUV5K3RSM3I0TGdIR09mdGwwY0pHWnVkOWF4QzQy?=
 =?utf-8?B?MGIwMWhGM3pvTmNNK3VyNkJCYUFCN1lUVUVoTytUVGtmK25NQW1IWWo3WEpu?=
 =?utf-8?B?ekxISjdKSEE5MzhwV1J4RGRhRGF4V0c4VkFUYWFTb01tOUd2NXVMb0lZalIx?=
 =?utf-8?B?YlVIRzVSNFlTeUFSVkUwRWNyNHhSYW9KN3A4WE9odXhLMEVwVnFhcEZ5Uklh?=
 =?utf-8?B?NmwwU09qcDBYQllqRVZVTmZCRVMvVHR4dm10Q1NBQ0tmWVU4ZzVBNHpNdEF4?=
 =?utf-8?B?S0VhWm1hNmJqQjNoTUNBYnZJNm5rb0o4UERlUHNZcXVycTZhK1VTK04vM3Fv?=
 =?utf-8?B?cDZxOWdlWVZyWWNUZU1DeEQwY0tIaDBQRUJCU05YTDV0SVFOSlk0c2FWcE56?=
 =?utf-8?B?OGJMWHVnQnhrU2k0YWlwTHl6ODM2cjBqU0d5U2ViWFA2NGRneTQrR2ZsYWlu?=
 =?utf-8?B?aEVXNFUyOU5UaE9TNS8vYmVzS3pJUFZzZ3VuelhkRlNtM1B6ZDJIQVAya3J1?=
 =?utf-8?B?VzlsekFPS0tKeG5iLzUveStBRzNkL0o4Q01LSjh6OHJwaGhRaUtjMzk3Rk45?=
 =?utf-8?B?UmZ2V1NpTUtkNm1HYWp6VkhMc21mNHlOdnZKdEs1dm94eVgydFZ0THZ0L0N0?=
 =?utf-8?B?QlMrb1RlVTVvNnBRNnlVdk9Nd3B0MlovSnhFb3FKRVJaZ3ZlYXlUVmdpMXBW?=
 =?utf-8?B?TWg0ckR1MmlXZXgzb2hWZjI4UlFqQVBDVE53WmZubXJPaEhWVWo1b3lILzZB?=
 =?utf-8?B?dHI0TjJzWnpIOXhNUnFjTm8yU0RVcWRrNmkvbnZKWXZSS2RsZ0FaRmswVUh4?=
 =?utf-8?B?TUVVZXppeTlnc1F1R3AwUy80UG10ZXNBcDdZUlBNVEl2eW10VmNpVGNabVhE?=
 =?utf-8?B?WDNFN1ZrTXZ6YUJRU2dqbk9YNzhRRVNDci9hc28zWkdZNjhxd2dqZzdoSG9O?=
 =?utf-8?B?ZEduSTNYaGlyUHpZVDNIRUU4Q0JGWmFmRVllOE5PcFV3Z0c5aDFENHJRc2l3?=
 =?utf-8?B?SC9yZDV0eWI4aDBkaEsxaEY2d0hsekhmYzFOcDBmcFpzUloyMGRzNFN4azRE?=
 =?utf-8?B?b0dGYzIrdkxMUmpjT2tKZWlsZ3FEVEM1RWhyMFpXZDBGRDVzT2pPNFBPc29H?=
 =?utf-8?B?UUZhejBmMUNydkNabzllUTUvckREZEdLUTRIWE5ic0k5dVBldm80aU10QXZh?=
 =?utf-8?B?VWswYlB3NGxNck0xa3ZPQ1AyNjRiU2hBaXE3blJ4ckZIbTRtanJJdW4wZ3Bn?=
 =?utf-8?B?R3BLRURIWlEwbktyaUJPNzgvd3lJd3B5NVpJdWQ5V0h0aUpJeUFpNlJyMWJ4?=
 =?utf-8?B?SWtXZDdJaVRJN01meHE0U0NmczhrM1lQUmh4T2grVjZXT2IwcjRXcHJPd25m?=
 =?utf-8?B?Qnh0RmVYSTd2NVp0YmQxOUJTTVhkUHkwb293KzBTWkVhVURnM0lsMEJ3Skc2?=
 =?utf-8?B?UEUwT3RNK1JGYVhTSys4Uis2TXB2Vm5zUHA2Z2F3VDRHWkZwbkFhVkJhc3Fj?=
 =?utf-8?B?cklEUWRaUWpGelVoUURRdmRTUDExY0hkYWJ3dnhFL3BtOTFIekJXL2dRNzdm?=
 =?utf-8?B?Vjg4RGFJT0JjUWlUalBsRGd6QVI1ZGJtbDFqQS9aNlBpNGJ0dXo1c1ovcTRG?=
 =?utf-8?B?U1l0L20zekdYMklsQnlPZXJZTElCaTQwVUpHb1ROR09nWmU3VDNvcFlmOUtP?=
 =?utf-8?B?MUNDYnBVWFJ6ZjY1U1ltVXJLMVJDaGNXcHFSdldOZnB3YkFka2pabFRrWmdk?=
 =?utf-8?B?MkxJcm9JSmFPY1dtUEtiNXlHRUp0TGhVMFVHTVhoZ3pET0R1UFc5c25maWF3?=
 =?utf-8?B?elY1RWxDSEM5QXJ1UjZqKzJGbHFuaDJPR3E2U1hxbHFKK1huVFNQWUhnNjNt?=
 =?utf-8?B?VGNMK0xYMGt1dHBpSlRNWnkxR1Y3NWZEZ3VZRjZjTHZ1TkYyRlVxTWZLMThh?=
 =?utf-8?B?RFNMeTBjajVlUzJFUHFTb1NOOWhsMGNpVUtOWldLaW54bXY1MXpxTVV6VkN4?=
 =?utf-8?B?bCtYd05HMkMvSzJkWExZdHhRU0MyUjhwSWxFaWRuRnhYc2p4bTYzY29BaXhi?=
 =?utf-8?B?Ui9sbTkxS1l1N3Jacm80WlpadFB4WHV4d3d4TWJtQ1Q1OXNGK0FxZVJDakxa?=
 =?utf-8?B?QXRJNTdGOCtEbWFoWEp6cDlyOVNkWVpGN3VMQzZScmZaMy93c0N6cHpjT2lz?=
 =?utf-8?Q?o0o0bI7LXXBamgjTaMr73oFI4ngJibj4UOI9JaLCwfLE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR18MB5368.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8ff66a-6b33-4f92-1ba0-08dd6c4c11c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 09:53:32.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/F/zzJ3favWyVUMwvbv3ROAnyMlzFZk21k0qOYgViw0zmONyI1ENCPdbfBekMNkNBwQOwyX81whJnljf5yk5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFECE6388CD
X-Proofpoint-ORIG-GUID: ZZ9LlRjTbE6Za_Hyh51ZuGTape974qsK
X-Authority-Analysis: v=2.4 cv=auuyCTZV c=1 sm=1 tr=0 ts=67e3ce9e cx=c_pps a=wXDgSYWbwZencpnnUUTq5g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=-AAbraWEqlQA:10 a=M5GUcnROAAAA:8 a=XjoPB2v7a1VmF-C-nIkA:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: ZZ9LlRjTbE6Za_Hyh51ZuGTape974qsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01

ID4gPiBGcm9tOiBTcnVqYW5hIENoYWxsYSA8c2NoYWxsYUBtYXJ2ZWxsLmNvbT4NCj4gPiBTZW50
OiBXZWRuZXNkYXksIEphbnVhcnkgMjIsIDIwMjUgMTE6NTIgQU0NCj4gPg0KPiA+IFRoaXMgdXBk
YXRlIGludHJvZHVjZXMgYSBuZXcgZmxvdyBmaWx0ZXIgc2VsZWN0b3IgdG8gbWF0Y2ggdGhlIEVT
UA0KPiA+IGhlYWRlciBhbmQgYWRkcyBhIG5ldyBmbG93IGZpbHRlciBhY3Rpb24gZm9yIElQc2Vj
IHByb2Nlc3NpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTcnVqYW5hIENoYWxsYSA8c2No
YWxsYUBtYXJ2ZWxsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlw
dGlvbi50ZXggfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCBiL2RldmljZS0NCj4gPiB0eXBlcy9u
ZXQvZGVzY3JpcHRpb24udGV4IGluZGV4IDAyMGQwOTAuLmNlZjEwOWQgMTAwNjQ0DQo+ID4gLS0t
IGEvZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXgNCj4gPiArKysgYi9kZXZpY2UtdHlw
ZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0KPiA+IEBAIC0yNjM0LDcgKzI2MzQsOSBAQCBcc3Vic3Vi
c2VjdGlvbntGbG93IGZpbHRlcn1cbGFiZWx7c2VjOkRldmljZQ0KPiA+IFR5cGVzIC8gTmV0d29y
ayBEZXZpY2UgLyBEZXZpY2UgT3BlICBcaGxpbmUNCj4gPiAgMHg1ICYgVklSVElPX05FVF9GRl9N
QVNLX1RZUEVfVURQICYgOCBieXRlcyBvZiBVRFAgaGVhZGVyDQo+IGRlc2NyaWJlZA0KPiA+IGlu
IFxoeXBlcnJlZltpbnRybzpVRFBde1VEUH0gXFwgIFxobGluZQ0KPiA+IC0weDYgLSAweEZGICYg
JiBSZXNlcnZlZCBmb3IgZnV0dXJlIFxcDQo+ID4gKzB4NiAmIFZJUlRJT19ORVRfRkZfTUFTS19U
WVBFX0VTUCAmIDggYnl0ZXMgb2YgRVNQIGhlYWRlciBcXCBcaGxpbmUNCj4gPiArMHg3IC0gMHhG
RiAmICYgUmVzZXJ2ZWQgZm9yIGZ1dHVyZSBcXA0KPiA+ICBcaGxpbmUNCj4gPiAgXGVuZHt0YWJ1
bGFyeH0NCj4gPiAgXGVuZHt0YWJsZX0NCj4gPiBAQCAtMjY5NCw3ICsyNjk2LDExIEBAIFxzdWJz
dWJzZWN0aW9ue0Zsb3cgZmlsdGVyfVxsYWJlbHtzZWM6RGV2aWNlDQo+ID4gVHlwZXMgLyBOZXR3
b3JrIERldmljZSAvIERldmljZSBPcGUgIFxobGluZQ0KPiA+ICAweDIgJiBWSVJUSU9fTkVUX0ZG
X0FDVElPTl9ESVJFQ1RfUlhfVlEgJiBNYXRjaGluZyBwYWNrZXQgd2lsbCBiZQ0KPiA+IGRpcmVj
dGVkIHRvIGEgcmVjZWl2ZSBxdWV1ZSBcXCAgXGhsaW5lDQo+ID4gLTB4MyAtIDB4RkYgJiAmIFJl
c2VydmVkIGZvciBmdXR1cmUgXFwNCj4gPiArMHgzICYgVklSVElPX05FVF9GRl9BQ1RJT05fSVBT
RUMgJiBNYXRjaGluZyBwYWNrZXQgd2lsbCB1bmRlcmdvDQo+IElQc2VjDQo+ID4gK3Byb2Nlc3Np
bmcgXFwgXGhsaW5lDQo+ID4gKzB4NCAmIFZJUlRJT19ORVRfRkZfQUNUSU9OX0lQU0VDX1JFQ0lS
Q1VMQVRFICYgTWF0Y2hpbmcgcGFja2V0DQo+IHdpbGwNCj4gPiArZmlyc3QgdW5kZXJnbyBJUHNl
YyBwcm9jZXNzaW5nLCBmb2xsb3dlZCBieSB0aGUgZmxvdyBmaWx0ZXIgcnVsZXMNCj4gPiArYWdh
aW4gXFwgXGhsaW5lDQo+ID4gKzB4NSAtIDB4RkYgJiAmIFJlc2VydmVkIGZvciBmdXR1cmUgXFwN
Cj4gPiAgXGhsaW5lDQo+ID4gIFxlbmR7dGFidWxhcnh9DQo+ID4gIFxlbmR7dGFibGV9DQo+ID4g
QEAgLTI3NDgsNyArMjc1NCw4IEBAIFxzdWJzdWJzZWN0aW9ue0Zsb3cgZmlsdGVyfVxsYWJlbHtz
ZWM6RGV2aWNlDQo+ID4gVHlwZXMgLyBOZXR3b3JrIERldmljZSAvIERldmljZSBPcGUgIFRoZSBm
aXJzdCBzZWxlY3RvciBpcyBhbHdheXMNCj4gPiBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9FVEgu
IFdoZW4gdGhlcmUgYXJlIG11bHRpcGxlICBzZWxlY3RvcnMsIGENCj4gPiBzZWNvbmQgc2VsZWN0
b3IgY2FuIGJlIGVpdGhlciBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9JUFY0ICBvcg0KPiA+IFZJ
UlRJT19ORVRfRkZfTUFTS19UWVBFX0lQVjYuIElmIHRoZSB0aGlyZCBzZWxlY3RvciBleGlzdHMs
IHRoZSB0aGlyZA0KPiA+IC0gc2VsZWN0b3IgY2FuIGJlIGVpdGhlciBWSVJUSU9fTkVUX0ZGX01B
U0tfVFlQRV9VRFAgb3INCj4gPiBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9UQ1AuDQo+ID4gK3Nl
bGVjdG9yIGNhbiBiZSBvbmUgb2YgVklSVElPX05FVF9GRl9NQVNLX1RZUEVfVURQLA0KPiA+ICtW
SVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9UQ1AgYW5kIFZJUlRJT19ORVRfRkZfTUFTS19UWVBFX0VT
UC4NCj4gSWYgdGhlIHRoaXJkIHNlbGVjdG9yIGV4aXN0cywgaXQgY2FuIGJlIHNldCB0byBWSVJU
SU9fTkVUX0ZGX01BU0tfVFlQRV9VRFAsDQo+IFZJUlRJT19ORVRfRkZfTUFTS19UWVBFX1RDUCwg
b3IgVklSVElPX05FVF9GRl9NQVNLX1RZUEVfRVNQLg0KPiANCj4gVGhpcyByZWFkcyBiZXR0ZXIg
dG8gaW5kaWNhdGluZyBpdCBpcyBvbmUgb2YgdGhlIGNob2ljZXMuDQo+IA0KPiA+ICBGb3IgZXhh
bXBsZSwgdG8gbWF0Y2ggYSBFdGhlcm5ldCBJUHY2IFVEUCBwYWNrZXQsDQo+ID4gXGZpZWxke3Nl
bGVjdG9yc1swXS50eXBlfSBpcyBzZXQgdG8gVklSVElPX05FVF9GRl9NQVNLX1RZUEVfRVRILA0K
PiA+IFxmaWVsZHtzZWxlY3RvcnNbMV0udHlwZX0gIGlzIHNldCB0bw0KPiA+IFZJUlRJT19ORVRf
RkZfTUFTS19UWVBFX0lQVjYgYW5kIFxmaWVsZHtzZWxlY3RvcnNbMl0udHlwZX0gaXMgQEAgLQ0K
PiA+IDMwNDYsNiArMzA1MywxNiBAQCBcc3Vic3Vic2VjdGlvbntJUHNlYyBPcGVyYXRpb259XGxh
YmVse3NlYzpEZXZpY2UNCj4gPiBUeXBlcyAvIE5ldHdvcmsgRGV2aWNlIC8gRGV2aWNlICBhdHRh
Y2ggSUNWLCB1cGRhdGUvYWRkIElQIGhlYWRlciBhbmQNCj4gPiBhZGQgRVNQL0FIIGhlYWRlci90
cmFpbGVyIHRvIHRoZSBwYWNrZXQgIGFuZCB0cmFuc21pdC4NCj4gPg0KPiA+ICtccGFyYWdyYXBo
e1BhY2tldCBwcm9jZXNzaW5nIG9yZGVyfQ0KPiA+ICtcbGFiZWx7cGFyOkRldmljZSBUeXBlcyAv
IE5ldHdvcmsgRGV2aWNlIC8gRGV2aWNlIE9wZXJhdGlvbiAvIElQc2VjDQo+ID4gK09wZXJhdGlv
biAvIFBhY2tldCBwcm9jZXNzaW5nIG9yZGVyfQ0KPiA+ICsNCj4gPiArSWYgYW4gSVBzZWMgYWN0
aW9uIHJ1bGUsIGVpdGhlciBWSVJUSU9fTkVUX0ZGX0FDVElPTl9JUFNFQyBvcg0KPiA+ICtWSVJU
SU9fTkVUX0ZGX0FDVElPTl9JUFNFQ19SRUNJUkNVTEFURSwNCj4gPiAraXMgbWF0Y2hlZCBkdXJp
bmcgZmxvdyBmaWx0ZXIgcHJvY2Vzc2luZywgdGhlbiBJUHNlYyBwcm9jZXNzaW5nIGlzDQo+ID4g
K2FwcGxpZWQgb24NCj4gPiB0aGUgcGFja2V0Lg0KPiBJIGJlbGlldmUgSVBTRUMgcHJvY2Vzc2lu
ZyBzaG91bGQgYmUgbGltaXRlZCB0byBvbmx5IHR5cGUgQUNUSU9OX0lQU0VDLg0KPiBDYW4gd2Ug
a2VlcCB0aGUgX0FDVElPTl9JUFNFQ19SRUNJUkNVTEFURSB0byBqdXN0DQo+IF9BQ1RJT05fUkVD
SVJDVUxBVEU/DQo+IE1heSBiZSBvbmUgd2lsbCBiZSBhYmxlIHRvIHVzZSB0aGUgZ2VuZXJpYyBy
ZWNpcmN1bGF0ZSBhY3Rpb24gZm9yIG1hY3NlYyBvcg0KPiBzb21lIG90aGVyIGRlY2FwIG9wZXJh
dGlvbiB0b28uDQpJIHRoaW5rIGNoYWluaW5nIG9mIHRoZSBhY3Rpb25zIGlzIHJlcXVpcmVkIGlm
IHdlIG1ha2UgSVBTRUMgYW5kIFJFQ0lSQ1VMQVRFDQphcyBzZXBhcmF0ZSBhY3Rpb25zIGFuZCBj
dXJyZW50IHNwZWMgZG9lc24ndCBzdXBwb3J0IHRoZSBjaGFpbmluZy4NClRoZSBjdXJyZW50IHZp
cnRpbyBzcGVjIHN0YXRlcyAiTm90ZSB0aGF0IGF0IG1vc3Qgb25lIGFjdGlvbiBpcyBldmVyIHRh
a2VuIGZvciBhIGdpdmVuIHBhY2tldC4NCklmIGEgcnVsZSBpcyBhcHBsaWVkIGFuZCBhbiBhY3Rp
b24gaXMgdGFrZW4sIHRoZSBhY3Rpb24gb2Ygb3RoZXIgcnVsZXMgaXMgbm90IHRha2VuLiINClRo
YW5rcy4NCj4gDQo+ID4gK0luIHRoZSBjYXNlIG9mIFZJUlRJT19ORVRfRkZfQUNUSU9OX0lQU0VD
X1JFQ0lSQ1VMQVRFLCB0aGUgcGFja2V0IGlzDQo+ID4gYWxzbyByZWNpcmN1bGF0ZWQuDQo+ID4g
Kw0KPiBJIHRoaW5rLCBiZXR0ZXIgdG8gc2F5IHJlY2lyY3VsYXRlIG9ubHkgb25jZSB0byBhdm9p
ZCBzb21lIGluZmluaXRlIGxvb3AgaW4gdGhlDQo+IGRldmljZS4NCj4gT3RoZXJ3aXNlLCBvbmUg
bWF5IG1hdGNoIG9uIGEgZmllbGQgYW5kIGp1c3QgcmVjaXJjdWxhdGUgaXQgd2l0aG91dCBhbnkg
cmVhbA0KPiBvcGVyYXRpb24uDQo+IA0KPiA+ICtTZWUgXHJlZntzZWM6RGV2aWNlIFR5cGVzIC8g
TmV0d29yayBEZXZpY2UgLyBEZXZpY2UgT3BlcmF0aW9uIC8gRmxvdw0KPiA+ICtmaWx0ZXJ9IGZv
ciBkZXRhaWxzIGFib3V0IGZsb3cgZmlsdGVyLg0KPiA+ICsNCj4gPiAgXHBhcmFncmFwaHtEZXZp
Y2UgYW5kIGRyaXZlciBjYXBhYmlsaXRpZXN9ICBcbGFiZWx7cGFyOkRldmljZSBUeXBlcyAvDQo+
ID4gTmV0d29yayBEZXZpY2UgLyBEZXZpY2UgT3BlcmF0aW9uIC8gSVBzZWMgT3BlcmF0aW9uIC8g
RGV2aWNlIGFuZA0KPiA+IGRyaXZlciBjYXBhYmlsaXRpZXN9DQo+ID4NCj4gPiAtLQ0KPiA+IDIu
MjUuMQ0KDQo=
