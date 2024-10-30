Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAD51E378D
	for <virtio-comment@lists.linux.dev>; Wed, 30 Oct 2024 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284711; cv=fail; b=COK6tbvaYTEE/5gl7Y4KkLU8YyFgX7mhYMTpCs4O9ObJhk+WDYubttI3h1aJ4fESF2hmrJu/4jTF/LG++kPfam/obkdXggA/83H13eadt8pnvC0gok00gZfdBSd3r5PvR93YrFmnpXz600RAtHaI6OmxONJxGTyU82FJeeIx9Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284711; c=relaxed/simple;
	bh=jCFDZHlatdYD/WVG9Xo5lTBnSEosUsF0BJwuJynOmsY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GbRRw5sctl0/SrJDy5teBEsTAF747QBvDxFEcLzLsER8Xj3LKZmlWcHPuSuDbcA8tfh+/9iT3EElEAez2DHQmjR8mTyVq6cv+HbUl5PPcXjgLxL5FTBF2mQ3/3XB8H4QrGWIGV8iT/Q5wD2NOnAYH+BBhW+WQcVvMMdt7El3DXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G3VRXKNf; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3VRXKNf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9Ct3Y022936;
	Wed, 30 Oct 2024 10:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCFDZHlatdYD/WVG9Xo5lTBnSEosUsF0BJwuJynOmsY=; b=G3VRXKNf825fkV9Q
	hPGarp+KvxUaMJ1GokRsaML/mB3vBoMGawAWLMtZ03j0ptLS/rqzHwWtnlfYWdxA
	lzx56K85T7jh/VHC+iGdZYcNB0KqOhM9IKfDIURMD9i9HcdgJOgz3s1m2pjFaY3f
	ANdLf5sxJykfLm/baOht4UvP+kFFkCQTfBUc9TFpBNN5z1qW1e0cZDRZHriXKzQT
	BTx7cttX6O7gd1gNubJeQs0g5ja5zHenwEuFHDOKtWivr+P2ebmrjLBzqSOecRQl
	vIZDOO3plHP1n6IV6e3uQYQLLdFdF3n1+c19BU39rbqgoi02p7wP9sCn0sNoiL6K
	xGRBtQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn53q2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:38:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnpcHf/bAcTdvU5rVZR7h08sZJYC0aPhmrMGvkzgSqGsP5MFfa7rIx0/kltPFMToJMzurk/CycPXtRvHc36e/EpawPkDYXDZgm9V/VHB9wiUtabpWJkfKoykiC/2FrsPbfrP5wMLMG4e+5VVGg3gDCtOhj0PbIglzLRphtquBBmJEu7UPPADWp4GjJtyscpzwoC/vv3htXeP+tIEZmRm3a7tUCFgu+Uick8x7kQ6EIpMMwSJcyMbLXb61h9HzzXW+JlkmGRsxtqCtNbSyDoQmaAaieElZY1fV19i4/ortveOll7/XgCqnHAH+a9VUa4jV0mmrMWv3Pv37E3UXJLRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCFDZHlatdYD/WVG9Xo5lTBnSEosUsF0BJwuJynOmsY=;
 b=GAeA3AvCGy4G+eoZQYs2N6GdjzL4s7QcTE/gAWAG74OVzEuvHQ/SFug5TF3jJ+NDvAtlM7Gz6U+tp6cX4DSGcbNxBPWS84/39bsSjFqGEEWAy6QIokcJB+jIo6Rcb2ZIgMoMkomzo2z+3U2QUE9sSxy4eTtZWWt6vql53mHZVc8/HmACGPhnZtpcM9VLQ/Oh1zLdUAWOLIDayhfOkX1/Rgi60iTB4M6skcezn/VZT2gxy1J1tRcixJlZPzqK8Lz/5sfoBbHhBLnbSFh5b7sJ4urfFACmzf8ILDVOwvvWGsuavMCbVDy+vthbA9RR6cse6Qjn+TD9zzqKC1wVhZ7sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MN2PR02MB7007.namprd02.prod.outlook.com (2603:10b6:208:207::16)
 by LV3PR02MB10643.namprd02.prod.outlook.com (2603:10b6:408:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 10:38:23 +0000
Received: from MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b]) by MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b%7]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:38:23 +0000
From: "Aiswarya Cyriac (QUIC)" <quic_acyriac@quicinc.com>
To: Parav Pandit <parav@nvidia.com>,
        "Aiswarya Cyriac (QUIC)"
	<quic_acyriac@quicinc.com>,
        "Alexander Gordeev (QUIC)"
	<quic_agordeev@quicinc.com>,
        Albert Esteve <aesteve@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbE/HmcELoI5U5U02p413zR13gCrJxyOaAgAxe4SCAIPgPAIAAJ/Sw
Date: Wed, 30 Oct 2024 10:38:23 +0000
Message-ID:
 <MN2PR02MB70075F9F639AFB00B9142A3690542@MN2PR02MB7007.namprd02.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB7007:EE_|LV3PR02MB10643:EE_
x-ms-office365-filtering-correlation-id: a104ec48-cac4-4007-ac34-08dcf8cefaf1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGs2ei9meDRVYzY4VGg4bkNNK1Fkem1IUHNaTHZRN0F6ZHhlYzV5d2dHU3lO?=
 =?utf-8?B?Sk1wV2t1TFE0RGRvN0Q1MjVtSUUxOVovbFp4REd3NGdCVmFxNGtBYTZJU003?=
 =?utf-8?B?K2xVemp1ZEozN3B1cmtXNWNYeW1iTzRJcnRKK043eHhOLzY1aTVaNGFnazI0?=
 =?utf-8?B?VjE4S2hWd1Q0YWJtYmZoL3pFd3ViZXlXMlN0WVpuMGZ3VmdvdWNaeWtwUEdq?=
 =?utf-8?B?N1NZbGdQZE9jTStMejRWMGwwVklEd2VacC9hY2FFUFFZQkxTVjUzSTdobFl4?=
 =?utf-8?B?cnFrbUJCeVk1N1Iya252NEVTbzhYVWtqS2krRElnRVJTWXRoWUorZU42REtl?=
 =?utf-8?B?TCt4R2ZmOE5PYTZoQ1BxbGdDdjlwU1U5cTc4bFkwOVlCbEJGSmhDRmFXbSs5?=
 =?utf-8?B?ZjZKcTh5c1lEeTM0VDFsUmpIbmlhWE1JRkZzdU80dEMvRmtPTS9TOXJjamRP?=
 =?utf-8?B?QXpqNnV2cndoa3d3Z1ZaaXhjSk5sSGdGeDd2eDNsek1tdHo3WDZhemNKLzBp?=
 =?utf-8?B?MGdmQjFWUjBoK3FTU2c2c0FMRWR1bVdlVm1GTStYdmFjY0I2Nm5vNXVmT3hw?=
 =?utf-8?B?Mi96cmY0YUtmeDEvSmROWU1wSGRLanRNbDFFbVVCUE1EdjRWMGFKdzJHUTF5?=
 =?utf-8?B?S0RSbG9DT0NBdUJyM0Q1cVBHRmpJQmI5aW5yb1daUSszQW5XeE1tNTdzQjN0?=
 =?utf-8?B?MkN4alJ1c1F2V2hTc1RLbFprSHdyTWVQemZBQVhKZllHNXlDUFVFL2VXVko0?=
 =?utf-8?B?bkhXYjNHSnFuajQ3TzlYQWlFZmpwOGovRlhvRkQ0bVR3cUxEdllIQzAzeFA4?=
 =?utf-8?B?ckRjNXhPQ29XTkNQTjZQL21kd283QTl1WnNrakt3VWsvTElubXFMUkJmSHFR?=
 =?utf-8?B?c0E2azZsZGxNYndBUFdVZkNDcmtJd2t6bklRTGx0Zjk3R29Ed3Axc3VUaUdY?=
 =?utf-8?B?cTh5eFZEbkJLVDBmWkUzclNLZktVNThUeXpZWHVyN21XOGtJL0hGL2VudmJN?=
 =?utf-8?B?MGNINGJ2bXZ6ZEZWaHhvM1NGdVRqNkpWamEzL1E0QllJUFNwUThOT2ZwcDZ4?=
 =?utf-8?B?a0FCcVRSVmJaRmpjNmFiY2hFOCtndUI4RUtJTmtCbTdLam9mcHFsa040TVRU?=
 =?utf-8?B?QnloQnVwOGJwMnBNK0xvZVJBbjZ6MGxQeDVNRmtiZElVZEV5cEp6UmlvZ1N2?=
 =?utf-8?B?enVvRFlZcGJsUGtmWklDY3VCOW9BKzBMV1lxSmt0d1YzVlZXamJ1a2FXenBQ?=
 =?utf-8?B?UzlpTnpwTlgrYWRXV0pualFGNnd6SWtTbUUvK1g4clhJZzUyeUt6N0FMbHNS?=
 =?utf-8?B?ejZmTFlteE5IRFhoYVl5QVVpSUFkcmZXb1ArZEd0RUFOdUFTeXVIaFRsdGdW?=
 =?utf-8?B?YjJtWHoyYmZGM3R3NkhaWXJ3N2dxWk1meUNBK29Vb3ZGL2xlVGNTMFFIYXMx?=
 =?utf-8?B?VVJXNzhOM0F4STdhbXZVRnczNEtPVkxydDVpM0x5Wk9xN0h6TUVjNVUzaXQ0?=
 =?utf-8?B?b0tsNSsrZGk1dkUrS2NrSTBVeGtxOWkyVEZrTzVJRVFGUW8rUmpHd3VDQmpi?=
 =?utf-8?B?dXZTRW1pUmxQMnAwZVpzK1NwTzdhY0pnVWpmc2JqbGt0R25xaStXRlU0NHpo?=
 =?utf-8?B?OXFER1VFSEtFVDZzYjd4K2tJMG9rbkNTZTIxNE5hclpMTCthQXpXc2t6Q25W?=
 =?utf-8?B?dXRWVTlsT0Q5ekVEV0xoT0FKRUllZmI1RW0yNzZjS3ZLS2Y5dHJ1OHNuNTk4?=
 =?utf-8?B?NWtBcExDbjg0ZzZZUUNpVzlVdWZmWDhCQjcxb1NUNjhtV2hkK0pqelJNV0RT?=
 =?utf-8?Q?Dh6Xj1d+INNSDAwXgV3EVjnqb4pqk4AfBYS40=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB7007.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHJieC9GMVY0UDlVTGZ2MmpoSWdQQXZtVTBIcCtuZzNnNWFOL2ZPckhuM3VB?=
 =?utf-8?B?WnVmUkJkV1ArV2JsRHhrNkpNenF5NXlETWJNOVQ4Z2pLeTZCaGNVb2ZiQUxi?=
 =?utf-8?B?ajVTK2hIcEFPbGhVam9mTytDdFl4dGYvdUxtVWNVV0lrQm1sSy9VSWt3a2Nn?=
 =?utf-8?B?akJPcGJmbEJHVlBIWlcrcDJsMEJxR1AzbEtvb0xKdjJMV3hOSXFrTzBJeFhT?=
 =?utf-8?B?d2d5b21lRVBsNlhxSVJ5VFVrc1M5bFlyemhGeHNMaFQrZDR4R0VCc0pQQUwz?=
 =?utf-8?B?bzUxN09CWmtuZ0NCeXhtNTBnUTRCczlxdUNWNDFTYWs0aHRUZ1YyT1p6eDhJ?=
 =?utf-8?B?TEVHNXAzNjNzSHBWYm92UUNYeGx3b0xsMDJYdmNDRGRNNjZPdkpnSmlrV1NG?=
 =?utf-8?B?VENaZ1JrNWg0U3VYL210RHpwUVRzV0htUUgwUzFOL3lSS2I4UDRLUHlTanUx?=
 =?utf-8?B?YlBTbFVuWnZTL3ZtQ0V6ZW5idU5TbXpJV0M4dFVvZVl5L0xDYksrYlhlSzNH?=
 =?utf-8?B?RjdSVDJSbENGYWY5Vjh6TUI2RVpxT0pxN0xzOHUweHNmbCtZNE1IV1ViQUY0?=
 =?utf-8?B?b1R1UEFSQkd0bURhVGo3QWNaa0tiRGpPNGp2eWVldHJDRlRLS1NwczdrRXov?=
 =?utf-8?B?WHBDdmU3QW5PMmQxM2ozR1ZwbWJpdFFzRzUyZm8vdjZ2dFB1bW0xcUdHSGZy?=
 =?utf-8?B?YjFYMHZSY20rS0lWM1lQRk5UU2tiVGhINE5JVG80K0lJV2RQYUhiTWkvZDlX?=
 =?utf-8?B?WTNDbHJYREpOYUlZdHdNSkVsQVZyQ0Y0c3Rwb3h6OGF1UjB1SzZtQVQxQVdZ?=
 =?utf-8?B?elMzMG1JeklDQW5HalcxbUV4U2x2Njg3emxZa1NXcGtaK0s2eUVNUFBtcWJT?=
 =?utf-8?B?N1ppTURnZG9iUVhvODZSMmZSck9aYWcrRXpycU0zRTNveUY5ZE03dUg5a0g5?=
 =?utf-8?B?WFF2dzVycmRXMHVISFVSTG00TUxjQWlkSHZlMDVGTUl5T0lzSmtPNGdqK2NX?=
 =?utf-8?B?Z1d6NSsweWNNM1lpbzlwR2czVU44S2NoeEY4dFdpbjZtVkxheC83cGEyZFJy?=
 =?utf-8?B?RFo5YWNuODRKWVRhZlNuTmVWNTdGcmVRTlhPVkxDOHhrd0lPaVNrb0dmVDZo?=
 =?utf-8?B?QUkvSUV3Q09pWC8vOUpLYUZubUo5V2s5ZXkxZTl2dnJPSEF0U2VneG1ESlgr?=
 =?utf-8?B?TTE2QWo0czJ2bmliaXdPa0d2cTJKdUFnQ2ZBQVZFc0lvREdzbFFSUUNEcVlo?=
 =?utf-8?B?MTZPeVg2Y3A4Tkpad3luaUpvY2RkM3A5UG9OWHE2NXAwK2tDMTIyUDl4RkxL?=
 =?utf-8?B?WmxJRW9oNmRFNTNlOEJVaVlqRzRpYzVBMHpBSXhUb3l2SmFicFJWKzd0Sk83?=
 =?utf-8?B?QWhTNjRnbzZiNGdGTFhTWVVkYWZlOHlFaGYvN1dOMjdLZC9URS9tTnR1VUZn?=
 =?utf-8?B?NVRoc2VRbE5QTTQ5RlBDeGwzK0JTYm5Gb0lOSzEzM1hBR2xSTWVhYzZ3cmNC?=
 =?utf-8?B?ZE1DVG5WZEFiVmx6K1IxcFNuamkvcDVTd0ZicGd2ZXpZbVlvWFV5OHk5ejBO?=
 =?utf-8?B?Q1RoTDlQNWZDNHM1bi8xcWh5YXhPRTBnNFdZRFNTQWs1bnZlREp4NmkrbVp0?=
 =?utf-8?B?MFVPeTlOMDJsaWRXNXJpZDRvYitkWkNTRTlRRkk1Vmc2WXYrRGw4NkFDUDJC?=
 =?utf-8?B?SUN3SitKQnpsMHFva1FkTDVheU1Xb1I5MXZnYWdmTlpQRmdDNTM5S3dSVkFZ?=
 =?utf-8?B?dkVScmNiS2c2MGhxK0haeEtJVEtxSUp1Q3BxdXNLRFQrRzZxRzZHSzkzYSto?=
 =?utf-8?B?UzJncmN3bkQ4V2ppT01ZcDVKQThZNEpqcjF4QVhvaXVDL3NZT3NoaUhhWFEx?=
 =?utf-8?B?aHIwcjhzZG1aOFgzcVdHTkRvWjlyTHVvQURXQW9zV2FuenpTeDhtbmw0WnA2?=
 =?utf-8?B?OGxDTCtESzkvcyt0OWR2NytadU9YM1I0MHdXcUo1NTZ1b3ZGWXVwRFZCbDlv?=
 =?utf-8?B?V1p2VWFwTUh5dVR4eFR1eFQ5ZEZVZTREK0I5dU04cGRvZ1loZkV4VFhpU3RK?=
 =?utf-8?B?V2dzVWtoZGFRSTloeVJFMEtrZzZqREtObTZ5V2hEYmtCYmp1NmswbkQ4ZHNW?=
 =?utf-8?Q?OqxNYNUQ+YUp8eZ8n2yiZneNY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	64cC95B3Zp9S6ZehfJ+2/eVQwvn8kpjpp3HHVq3p5JXc1sLiITxmE4QKT5cywQFg0paX3BnEOitgOrhqKEOCy0vojqLmvsFAuN0nAXSXF7kUHV4pR7QmX+/9LFlMmrXGjQ0YM61yUFedeBd1QytNKqz/2zNpXg+25s70FMQVbG+IrvwFINH3EoR7sClH/jgKvpX3nRoDaI5ABdSfpSDezwwLUfD/iaB80jht6rClspVl3bAM6zGYPzPGjJp++008KsyAwAAYtlnizhZ5IhBglRHLSWytfU0qSJpYaIPYZ+QwsFp9abPXwfL/F4HUvUs/sdbob118wgi58bXFoVa27SCfuHNGW11oW/CUzoOnUry6aLyd0MeO1mktQ6xUwH1D8u2bMRxfIcrV9jLFo24LnSIDaQO8JLPp1OtVkqRvHvxKQUy3NdvAgvHl3YCX1DPL5tt7nuVpG31Qkn7nGETkKtPWyaHFhYyo4hn1hTGlIiKtZehFMvJQPQ8yFZ79T2QflM0/GLik867lSwNOu+6Q1lLZbffnAFhewb/2dLCSO8MJQK0EpbjF/FR7X9FwYXPhQyrZa49ZbIbKTflarIlM3JcNRtEY8iCp3frnAWOK+I/rYlksa3VynxXwNhN0XKy/
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7007.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a104ec48-cac4-4007-ac34-08dcf8cefaf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 10:38:23.6553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8UHBijqf+e6j9mJ3mh6paKAlakeEeuLB8MGRiBAnHju9YhdNxaEEVgWQ6GqhhbSXYuJlh1ssfmsvY/2IuEmefthsWhqPyZ3WoIEoYI8idc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10643
X-Proofpoint-GUID: lBkKASHyAqNeOuSR0v3XQ2E-CfaDmZjg
X-Proofpoint-ORIG-GUID: lBkKASHyAqNeOuSR0v3XQ2E-CfaDmZjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300082

SGkgUGFyYXYsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFyYXYg
UGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAs
IDIwMjQgOToxNSBBTQ0KPiBUbzogQWlzd2FyeWEgQ3lyaWFjIChRVUlDKSA8cXVpY19hY3lyaWFj
QHF1aWNpbmMuY29tPjsgQWxleGFuZGVyIEdvcmRlZXYNCj4gKFFVSUMpIDxxdWljX2Fnb3JkZWV2
QHF1aWNpbmMuY29tPjsgQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUByZWRoYXQuY29tPjsNCj4gdmly
dGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2DQo+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEg
ZGV2aWNlDQo+IA0KPiBIaSBBaXN3YXJ5YSwNCj4gDQo+ID4gRnJvbTogQWlzd2FyeWEgQ3lyaWFj
IChRVUlDKSA8cXVpY19hY3lyaWFjQHF1aWNpbmMuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwg
T2N0b2JlciA5LCAyMDI0IDI6MTcgUE0NCj4gPiBUbzogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlk
aWEuY29tPjsgQWxleGFuZGVyIEdvcmRlZXYgKFFVSUMpDQo+ID4gPHF1aWNfYWdvcmRlZXZAcXVp
Y2luYy5jb20+OyBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+Ow0KPiA+IHZpcnRp
by0gY29tbWVudEBsaXN0cy5saW51eC5kZXY7IEFpc3dhcnlhIEN5cmlhYyAoUVVJQykNCj4gPiA8
cXVpY19hY3lyaWFjQHF1aWNpbmMuY29tPg0KPiA+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcN
Cj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzXSBjb250ZW50OiBSZXNlcnZlIElEIGZvciBtZWRp
YSBkZXZpY2UNCj4gPg0KPiA+IEhpIFBhcmF2LA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0K
PiA+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDI0IDE6NTMgUE0NCj4gPiA+IFRvOiBB
bGV4YW5kZXIgR29yZGVldiAoUVVJQykgPHF1aWNfYWdvcmRlZXZAcXVpY2luYy5jb20+OyBBbGJl
cnQNCj4gPiA+IEVzdGV2ZSA8YWVzdGV2ZUByZWRoYXQuY29tPjsgdmlydGlvLWNvbW1lbnRAbGlz
dHMubGludXguZGV2Ow0KPiA+ID4gQWlzd2FyeWEgQ3lyaWFjDQo+ID4gPiAoUVVJQykgPHF1aWNf
YWN5cmlhY0BxdWljaW5jLmNvbT4NCj4gPiA+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcNCj4g
PiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlh
IGRldmljZQ0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+IEZyb206IEFsZXhhbmRlciBHb3JkZWV2IDxx
dWljX2Fnb3JkZWV2QHF1aWNpbmMuY29tPg0KPiA+ID4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVy
IDEsIDIwMjQgNDozNiBQTQ0KPiA+ID4gPg0KPiA+ID4gPiBPbiAwMS8xMC8yMDI0IDEwOjM5LCBQ
YXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+PiBGcm9t
OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPiA+ID4+IFNlbnQ6IFR1ZXNk
YXksIE9jdG9iZXIgMSwgMjAyNCAxOjM1IFBNDQo+ID4gPiA+ID4+IFRvOiBBbGJlcnQgRXN0ZXZl
IDxhZXN0ZXZlQHJlZGhhdC5jb20+Ow0KPiA+ID4gPiA+PiB2aXJ0aW8tY29tbWVudEBsaXN0cy5s
aW51eC5kZXY7IGFpc3dhcnlhLmN5cmlhY0BvcGVuc3luZXJneS5jb20NCj4gPiA+ID4gPj4gQ2M6
IGFjb3VyYm90QGNocm9taXVtLm9yZw0KPiA+ID4gPiA+PiBTdWJqZWN0OiBSRTogW1BBVENIIHYz
XSBjb250ZW50OiBSZXNlcnZlIElEIGZvciBtZWRpYSBkZXZpY2UNCj4gPiA+ID4gPj4NCj4gPiA+
ID4gPj4gSGkgQWxiZXJ0LA0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBGcm9tOiBBbGJlcnQgRXN0
ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4+IFNlbnQ6IFdlZG5lc2RheSwgU2Vw
dGVtYmVyIDI1LCAyMDI0IDEyOjIwIFBNDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+DQo+ID4gPiA+
ID4+IE9uIEZyaSwgU2VwIDYsIDIwMjQgYXQgOTowOOKAr0FNIEFsYmVydCBFc3RldmUNCj4gPiA+
ID4gPj4gPG1haWx0bzphZXN0ZXZlQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4+IHdyb3RlOg0KPiA+
ID4gPiA+PiBSZXNlcnZlIGRldmljZSBJRCA0OSBmb3IgbWVkaWEgZGV2aWNlLg0KPiA+ID4gPiA+
PiBDb21wYXRpYmxlIHdpdGggdmlkZW8gZW5jb2RlciwgdmlkZW8gZGVjb2RlciwgYW5kIGNhcHR1
cmUgZGV2aWNlcy4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gU2lnbmVkLW9mZi1ieTogQWxiZXJ0
IEVzdGV2ZSA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPj4gLS0tDQo+ID4g
PiA+ID4+IMKgY29udGVudC50ZXggfCAyICsrDQo+ID4gPiA+ID4+IMKgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvY29u
dGVudC50ZXggYi9jb250ZW50LnRleCBpbmRleCAwYTYyZGNlLi42ZDZiM2Q4DQo+ID4gPiA+ID4+
IDEwMDY0NA0KPiA+ID4gPiA+PiAtLS0gYS9jb250ZW50LnRleA0KPiA+ID4gPiA+PiArKysgYi9j
b250ZW50LnRleA0KPiA+ID4gPiA+PiBAQCAtNzM5LDYgKzczOSw4IEBAIFxjaGFwdGVye0Rldmlj
ZSBUeXBlc31cbGFiZWx7c2VjOkRldmljZQ0KPiA+ID4gPiA+PiBUeXBlc30NCj4gPiA+ID4gPj4g
wqBcaGxpbmUNCj4gPiA+ID4gPj4gwqA0NcKgIMKgIMKgIMKgIMKgJsKgIMKgU1BJIG1hc3RlciBc
XA0KPiA+ID4gPiA+PiDCoFxobGluZQ0KPiA+ID4gPiA+PiArNDnCoCDCoCDCoCDCoCDCoCbCoCDC
oE1lZGlhIGRldmljZSBcXCBcaGxpbmUNCj4gPiA+ID4gPj4gwqBcZW5ke3RhYnVsYXJ9DQo+ID4g
PiA+ID4+DQo+ID4gPiA+ID4+IFRoZSBpZCA0OCByZXF1ZXN0IHdhcyBtYWRlIHNldmVyYWwgbW9u
dGhzIGFnbyBpbiBNYXktMjQgZm9yDQo+ID4gPiA+ID4+IHVzYiwgbm8gZnVydGhlciBpbnRlcmVz
dCBoYXMgYmVlbiBzaG93biBvbiBpdC4NCj4gPiA+ID4gPj4gQmV0dGVyIHRvIGF2b2lkIGhvbGVz
IGluIHRoZSBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPiA+ID4gPj4gU28gaWQgNDggd291bGQg
YmUgYmV0dGVyIHRvIHVzZSBmb3IgbWVkaWEgdGhhdCBoYXMgaW50ZXJlc3QuDQo+ID4gPiA+ID4+
IEFkZGVkIHZpcnRpby11c2IgcHJvcG9zZXIgdG8gdGhyZWFkIHRvIHNlZSBpZiBpdCBpcyBzdGls
bA0KPiA+ID4gPiA+PiBpbnRlcmVzdGluZywgaW4gdGhhdCBjYXNlDQo+ID4gPiA+ID4+IDQ5IHNl
ZW1zIGdvb2QgaGVyZS4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gR2l2ZW4gdGhlIHZvdGluZyBo
YXMgc3RhcnRlZCwgSSBhbSBub3Qgc3VyZSBpZiB0aGUgcmVhbCBpZA0KPiA+ID4gPiA+PiB2YWx1
ZSBtYXR0ZXJzIGFzIGxvbmcgYXMgb25lIG9mIHRoZSB1bmlxdWUgaWQgaXMgcmVzZXJ2ZWQuDQo+
ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEFuZCBkbyBub3QgcHJlZmVyIHRvIHJlc3RhcnQgdGhlIHZv
dGluZyBmb3Igc3VjaCBhIHNtYWxsIGNoYW5nZQ0KPiA+ID4gPiA+PiBlaXRoZXIgb24gbXkgbGF0
ZSBvYnNlcnZhdGlvbiBvZiB0aGlzIGhvbGUuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEkgdGhp
bmsgd2hlbiB0aGUgbWFpbnRhaW5lciBtZXJnZXMgdGhlIHByb3Bvc2VkIHBhdGNoIHRvIGFzc2ln
bg0KPiA+ID4gPiA+PiBpZCA0OCwgc2hvdWxkIGJlIGZpbmUuDQo+ID4gPiA+ID4+DQo+ID4gPiA+
ID4+IE1pY2hhZWwsDQo+ID4gPiA+ID4+IEFyZSB5b3Ugb2sgdGhpcyB3YXk/IE9yIHlvdSBoYXZl
IGJldHRlciBzdWdnZXN0aW9uPw0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBBaXNod2FyeWEsDQo+
ID4gPiA+ID4+IElzIHZpcnRpby11c2Igc3RpbGwgaW50ZXJlc3Rpbmc/IElmIHNvLCBjYW4geW91
IHBsZWFzZSByZXF1ZXN0DQo+ID4gPiA+ID4+IGZvciB0aGUgdm90ZT8gU28gdGhhdCB3ZSBhdm9p
ZCB0aGUgaG9sZSBpbiBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPiA+ID4gPiBJIHJlY2VpdmVk
IGF1dG8gcmVwbHkgZnJvbSBBaXNod2FyeWEncyBlbXBsb3llciB0aGF0IHRoZXkgYXJlDQo+ID4g
PiA+ID4gbm90IHJlYWNoYWJsZQ0KPiA+ID4gPiBkdWUgdG8gYWNxdWlzaXRpb24uDQo+ID4gPiA+
ID4gU28gbm90IHN1cmUgaWYgdmlydGlvLXVzYiBhbmQgNDggaXMgc3RpbGwgcmVsZXZhbnQuDQo+
ID4gPiA+DQo+ID4NCj4gPiBXZSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgdmlydGlvLXVzYiBkZXZp
Y2UgYW5kIHdvdWxkIGxpa2UgdG8gcmVzZXJ2ZSBJRCA0OCBmb3INCj4gaXQuDQo+ID4gSG93ZXZl
ciwgSSBwbGFuIHRvIHB1c2ggYSB2ZXJzaW9uIDIgcGF0Y2ggdG8gZW5zdXJlIHRoZSByZXNlcnZh
dGlvbg0KPiA+IGNvdmVycyBub3QganVzdCB0aGUgdmlydGlvLXVzYiBob3N0IGNvbnRyb2xsZXIs
IGJ1dCB0aGUgdmlydGlvLXVzYiBkZXZpY2UuDQo+ID4NCj4gQW55IHBsYW4gdG8gcmVxdWVzdCBm
b3IgdmlydGlvLXVzYiBkZXZpY2UgaW4gbmV4dCB0d28gd2Vla3M/DQo+IElmIG5vdCwgdGhlbiB2
aXJ0aW8tbWVkaWEgY2FuIHByb2NlZWQgd2l0aCBJRCA0OCAodGhpcyBpcyB0aGUgZmlyc3QgZnJl
ZSBpZCkgYW5kDQo+IGxhdGVyIHdoZW4geW91IGFyZSByZWFkeSwgdmlydGlvLXVzYiBjYW4gcGlj
ayB0aGUgbmV4dCBmcmVlIElELg0KPiBUaGlzIHdpbGwgaGVscCB0byBub3QgY3JlYXRlIGFueSBo
b2xlcyBmb3Igc29tZSBpbmRlZmluaXRlIHRpbWUgaW4gdGhlIElEIGxpc3QuDQoNClRoYW5rIHlv
dSBmb3IgY2hlY2tpbmcgd2l0aCBtZSBhZ2Fpbi4NClVuZm9ydHVuYXRlbHksIHRoZSBwcm9jZXNz
IG9mIHVwZGF0aW5nIHRoZSBwYXRjaCBpcyB0YWtpbmcgbG9uZ2VyIHRoYW4gZXhwZWN0ZWQgYW5k
IHdlIG1heSBub3QgYmUgYWJsZSB0byB1cGRhdGUgdGhlIHBhdGNoIGluIG5leHQgMiB3ZWVrcy4N
CkkgYW0gcmVhZHkgdG8gcmVzZXJ2ZSB0aGUgbmV4dCBmcmVlIElEIGxhdGVyLg0KDQpUaGFua3Ms
DQpBaXN3YXJ5YQ0K
