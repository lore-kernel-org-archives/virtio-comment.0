Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9B4C6D
	for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739947210; cv=fail; b=lUaxroedT8ASnP627WqRWAiJGvPAZ2yX2CZEoiJKPa7wPn7mTJhffjWjVNdcdrqc4pOdVtuO9oIMFLzesepegeLfKDJ88JVTmg4uGD3mikNbYqdIvtjSE91su+AKN27OPPL6JuOCFjXUM0B2PIaX7Po/COm7+i9eU7VvrcwKOaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739947210; c=relaxed/simple;
	bh=q4SFIlP21+uI0ypGsWTiS/wrHb6v35+FG/PzGAHtfUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Pwdp3pTRuJa0ltS3SMIaLYvUakAJl+rGiLUWZfHKWoNVnghrzA65gdnDdpdMjs8Qo/EjR+wrRdNJKdwPnAodchFBFXgIGwty5vzSCx7//BQDntSOnqCUEYOJiY76cu5b7YCJsLmp6bQ/uRS922jNteU8ONDmA681u8WFZ1nxBnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=DNr0iitu reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="DNr0iitu"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IJZuRc016467;
	Tue, 18 Feb 2025 22:39:59 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44vyyt99wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 22:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvCuoE6uktKM/EqDj6WAXVDqI5y23hnFZEwaunwem86Z0wLbHoQrZc5LzEdE8KN3+TuQAdf7oEbiAra6Ih70NKL0h4UXg5m7XkYkVruSwFrOrmYFd3uhw35HNnTSW+GteH+TI6JzyeBtPzwAyr9zM5PX0gqxk3axPYhPtRZ/0Us1Rzgci8Uq3OUKNH53QB8FFmlnaFTW6cPO9tOInMr16Qarw8d5MGIni4tK9pogPgRrf6+V2RzfxrBUtT9q9AhKWePcVdYlL5RcdhS877CB2cz/GWTk6sziCWKsMb7hS+J0xE6/bT3C5O9Oc2BfP4og4meQsa9Tf+r1l+4lBi+eRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN6lgeuR/uGpQqn960Eb0DbIr4QRejBQZrjQL1ZlK4k=;
 b=KiKxflXFTJfeDXqKE6KfZyxzGMMtUi8nOhjt7PtjoVMpnfzSguKtUQMrygCtI/Y1hpDXQmwxR1D7lKrjy5G55QVxujAtQJ1uZiP9dCeLJdbwP7v6tgC7R3teqhwTIBiaRxSw1B5VuytKw5kPwen68oJzONUQctan//eCCL9m4C0w5s0hmq+yK/Qnv3EZ7NUPAHCTgnAUeNrwKoSYe3kXqpWw/QMs752upOALjLapE9mOnhlm1dq+LAyqjRYLSvZUwWnL5+Zd+SwmoySKW6rx8gK2yhvh3sL6EEvUkXVbNhTGkI12GfAHVeAF1jJjBvzS4k7w0I7dSI4XOTc7B4Ws8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN6lgeuR/uGpQqn960Eb0DbIr4QRejBQZrjQL1ZlK4k=;
 b=DNr0iitulEUA1oQwWqggwPJap+4Ril9lnHzGXUr1StCkycsDfEskcr115vPdml4D0Vd/eRW74Hra3hHM3VlkWHow/pTm+Nsfa0JYOPr/5bE+dyQA3tDt1MqcqX66EhrD1Ui2js779JCMzawWqvAA/NBjvcgEDIgf/g1WF410iWw=
Received: from CH0PR18MB4260.namprd18.prod.outlook.com (2603:10b6:610:bb::6)
 by SA1PR18MB6018.namprd18.prod.outlook.com (2603:10b6:806:3ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 06:39:56 +0000
Received: from CH0PR18MB4260.namprd18.prod.outlook.com
 ([fe80::6c0e:c009:33dc:23a0]) by CH0PR18MB4260.namprd18.prod.outlook.com
 ([fe80::6c0e:c009:33dc:23a0%4]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 06:39:55 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Jason Wang <jasowang@redhat.com>
CC: "pabeni@redhat.com" <pabeni@redhat.com>,
        "willemb@google.com"
	<willemb@google.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Nithin
 Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Rahul Bhansali <rbhansali@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Topic: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Index: AQHbgn6ramcqJN/HSUCxE4NY9IHmd7NOJz3Q
Date: Wed, 19 Feb 2025 06:39:55 +0000
Message-ID:
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
References: <20250217172509.107212-1-kshankar@marvell.com>
 <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
In-Reply-To:
 <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR18MB4260:EE_|SA1PR18MB6018:EE_
x-ms-office365-filtering-correlation-id: fb5f5496-dc6d-41da-4c88-08dd50b0390c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?akpEZ3p1V21SSkpGeFRpazRYQ1BFK2ZrWHFweEw1R0FCbzZ0SVBUaGxNSUJP?=
 =?utf-8?B?VUY3d3NVd3JoVCt5RXlFQTRvdDNWQzdPTGRZTnIxd3JoUysyZThzVm1NV3ov?=
 =?utf-8?B?OGNwdEhYeEdYc3lHYTk3cVMvRzI5UWFqSjhtYVY5QnVZbWZmSFJSQzNrQndV?=
 =?utf-8?B?cVhvZlRTUDBPS3IxQ1F4Mk5kUmZjLzR1OGUrbjFNM2Yra2VwdTQyWVRpTFUr?=
 =?utf-8?B?bUh1bi9JRUZDVUpPNDJZb2Z5aDI2MXQ0VUNET0czKzZsczBwWFRhWHZNZmcx?=
 =?utf-8?B?TVRBL2pHMElPNE1XcVpGK0tPRGRzVUp1WXozZ1Vmdkt0SWtVVjRtTXZ6Q0o2?=
 =?utf-8?B?RTJVUVlYNjRtNEJsU3RqTXdHb3QzN2kvQVFpWG16bVh2UnZvMmVCVTBsUElw?=
 =?utf-8?B?YTBlbGNuMVpRdGZRNFlWZmRTZnN3dUJabEoyVGlWQysrSzhSK3RzWWR5UFRi?=
 =?utf-8?B?Zm1WKzBLbzNxYmtrL2lFMGM1SlFWQ3NXMGFaY3ZObUdtNkVCcmhHQWVqYTEr?=
 =?utf-8?B?QzBXV0krSkwzT1M1MWkreTk2N0RzQzdlb1ozZnlLdFExK3lrZ3hiM2pJQjNj?=
 =?utf-8?B?UGlUYnJNNXp0ZUR4TFFNZ2RUczV2T2VkSjZDT0Y2MCtuSjY0SmhVRjZHSXlv?=
 =?utf-8?B?RjRPNEN2aWRrd29VdVV3NDBSdGpKRUxyZWdvMHkyOERtRUxlb0wzSS9HY0Zz?=
 =?utf-8?B?dnBidFkrK1gwWFhYOUJjN3p0M2MvTHZmZ2hlRmdHMTJ1NS9zRXo3M0hEN0tH?=
 =?utf-8?B?M3F3YzJiYmdHR0cyZ2RmajRNUWZLSjRqVzF5d0M2bVRDblJJMG1ZZGJJaFlv?=
 =?utf-8?B?K3JBbmtneFFMUWtFaEVtN2tSekg4czVjbDJZUGlOOStnK3YzNkhZc1BJclV6?=
 =?utf-8?B?MXVlcm5JaDJKcUtROTlCTXB5YU0zUEszcU1ZLzlTeGVDSlNYWFZCZnFLaTNU?=
 =?utf-8?B?TXJ6T1JvdktqYmdRSWFFM3lwa0lmNEFyT2FkYTVyclkwZlF3NnN3TFJTL3F2?=
 =?utf-8?B?cjNISyt3c0daQkNtdm9FVDdKZmRnWFRNNzlIT2NabjRBU0FZYWlVSlpGaUVk?=
 =?utf-8?B?eURVMHFYcUVDQzNYV1ltVmxCWm4rSFhreUsrUzZidGE2QkRxc202YTFrL0Jv?=
 =?utf-8?B?Vis3SkJoZ011dnZXV3FmM3g4eHVLTUxtWjdEaGxxVU92QWlYcktxZVJVNTZR?=
 =?utf-8?B?b1Awc29nTnpBRnZzaHFBU2ZIdjRJWFlpMzhsVTJjQkxoNzdkLzFBRDVsWlpx?=
 =?utf-8?B?bWE4VUpCQkVLOHpYdW9Ld3lVbUtvU3JIL3R0VlRtVWpyR1dObXNYVUtVa1RS?=
 =?utf-8?B?Szg1RHpDclQxRUxUNDlJdFZ4RndsVy9qWmRlSlYzZFJqNzRzZ2R1MG14VEN0?=
 =?utf-8?B?SnRyekk2OFZLNHVZczBZMzYreENucDRTVWZQMCtmamVNRUlEdmpiQzkyR21K?=
 =?utf-8?B?ajVaTzNjWThuUkI4R1JGYnBzZVEyZTFJQ1BVYTFXRnF6ZU1qaGpXYXRvNXRQ?=
 =?utf-8?B?dTBWeUgvMkNYTnlRS3o1UU4vL3NOL1BzaGpBTWxsc05BWEo0TlRUWXN0ODQy?=
 =?utf-8?B?RVd5WGlHelh0RDdGdVJGSWZ3aUlwTUE3Z210cFNFV3YrUWhxdmVTVVl2dlgz?=
 =?utf-8?B?Kzk2QkQ4K3VJVmNlb0ZoUHNDdHlXZGxvUk1DU1BzV3dNb2FjdUVMSVJQR3pS?=
 =?utf-8?B?VGlOaXQraEVpaUdlc0YxdFNSY3lxR2J0eXNRYlQ0ckx1OWp6bUhhaFpDeFd0?=
 =?utf-8?B?VUdhbFEwVTFzUWlnWEVOZGxjV0dUbkoyMWtxREw4RmJqdW9KTFJkdzZkNnVp?=
 =?utf-8?B?TzVsWjVHd2crQTBXcE5LRFVycXA1azdpRWk1YVFzTEwwd0w1MVNJdnhVNXRn?=
 =?utf-8?B?WUZRbTduQkJXdURTait2SDEwc3d2L1VIQzJQMCs0akNDVEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR18MB4260.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTJpVDlLSlZmL3A0QmVTK05aU2VMRDhYRVpXcWhoV0E0VThRTUNBNjdRMzZk?=
 =?utf-8?B?M1ZoTVBvaUFQdDlSUkpJa3Bjc1ZONTVIWFczd01mTGtqdVV4Z1VQMWhYM2p2?=
 =?utf-8?B?TnhNbkdMVUJHSEVBaFdSUlJWS2hwWVgvcG90VERZbmtpMjFyRzVLOEZuVGt6?=
 =?utf-8?B?V0xFR3doN1pKWHI3T3hBWW5WVktPTXk4ZXk5cmsvNEV1WlJnK2dzMU9PZFVW?=
 =?utf-8?B?NDdUNUhNT05mZWdYRzZSY1h2KzI5VVRzTC9UaXluY2lrdGUxUlFmMk1waEVD?=
 =?utf-8?B?Mjk1TlB6cHMvZmZSRk1OeTFoU0t1ZEZFa0htL3R5OGgyVktoek9xVkVsVERz?=
 =?utf-8?B?WVZVaVhHZUc2d2F4MG1xTHJQSVUzeGpPVktRdHl4TXBBdHI2MlBWUGNHVHc5?=
 =?utf-8?B?eWFXQkMxZEl5K3BUMHRnZFRDbHIvOTdTNm9qcmltM2tOMGtoVTRvY2U1TUhZ?=
 =?utf-8?B?UEdpUXpBOXgwUDNtODA1RkVKZnIwNDRQVjArRzBUNnVkZVd5bXBiS21XZEZG?=
 =?utf-8?B?OVdxbWd5cTRsNHJmMjMzN2VsUmJYSFptWWJaY0pjbUZxeEFSVW9IZk8rR3N3?=
 =?utf-8?B?NGNHSGRTZGV3SVBlMWNuUG8zVUlLakx2WC9xVTRpbklJcW1naHE2ZFNHSTNS?=
 =?utf-8?B?S01sdUlEQkJhc3lVVjVXL01TemlnRDNZRmM5QWtVbklRSFBSTmVOeXpmUStv?=
 =?utf-8?B?eFd3QnQvOVlBREpMMHdvRGdqUHpxSkd0ckdXcndmVHVIRHowKzNjVWRYbzlB?=
 =?utf-8?B?cE9DRmlkdDhFYXRmVGZneTJKS0FlQy9CNUo2T21JVzFuaGFwSGNnTnMyUUdQ?=
 =?utf-8?B?Y0lOd3pMcDg2RjR1R1p5WkRXR1labW1wOGNuQ2ZheUdjeUhmQXM4eE05ZTdJ?=
 =?utf-8?B?ZDlqZ1VTYkRaOFBTS3BvV3crNlF1S3FiM3BaRzNhTnJhUjhFMlhVSTBLTzJ5?=
 =?utf-8?B?QnI1SFJzcThWR0o4ellQOGlLa2dvZXNZK2FWaThHQ2hmRi9ocElQTDR3eXZ2?=
 =?utf-8?B?NjFyN2dvQkxBZ0pwTmxwVXEyWWNwajZqNGtNc2JRbEhGNVc5RVVUblRvNXlN?=
 =?utf-8?B?ZmVWckNWczVjSlE1VXZiZmFoUHhTSEZiNU8xYUVoZzZCMk9Uc3YrL0FMSDFu?=
 =?utf-8?B?dXFyaHROaWxnTzhXZ294Sk5KRXpQcFBzemRXUFVCRkhQbGlBYW4zRnlBWDdp?=
 =?utf-8?B?K3FMVHByMG5HU2FiR0NtNGowWGJSN0Z1bnJQWVZtQUI1ODZXZzA1eTJjQjJo?=
 =?utf-8?B?ZitNWEVYZmwxaWh3Nm9aMlBWeldtazI0UVFUWUw1Z2FEV2RmejE3aFFIR3Jz?=
 =?utf-8?B?Zys1emhRZUJpWXY3SkdKQVZXNFljZWhpQm13d0xLNW1kL1FVd01yU0NOZ0cx?=
 =?utf-8?B?LzZlc3dpZ1Q3Zy9aS3RNL2g1REl4d1VRZmR5MWUwckhWaXpCdGIybkg5d1NB?=
 =?utf-8?B?bG5McFJxa0FJenA1NmNhSitHSEZKelYxem1QN1IrSUZFb1l2V1c4N0pwVy9x?=
 =?utf-8?B?RGZlYnZESFhXSkFIVm55V1E4RXZ1OC8rL3VoVjZwVzNoSzNENkEvSUNwMWll?=
 =?utf-8?B?VWF0SmtkTysrQ3o2SCtOQ1RoRjMrOFYramhjWm85VkVIM3RQek93OEZHTFR3?=
 =?utf-8?B?ZVc1WFpMaUtPeEZBdnUyakk3ZWZyQm1FWlZFUTIrYmhjV0tPZ1pmbm83MFNa?=
 =?utf-8?B?bXVTSjNPaFV1emJ2di9sTUY3SWkvZXVRaFZoRnFVUU9LZzhtRVBoY3FkUlFM?=
 =?utf-8?B?UWM1Sm5aZ21DVWZ0QVB4VkVUM3V1SC9EYlIzMTQwVGdmN2hRWVkxNXllMFJR?=
 =?utf-8?B?K0tpeXZSSXg4L0VVWitMemxGT0Y2cnl1d3NUMjROU0lYbWliRVZEdU8zRmFM?=
 =?utf-8?B?MnZtc1NnbElKcjlsd3dRLzJJR3pSVzRPek1UeThNOWhmWlhtRDJYcjUzL2lz?=
 =?utf-8?B?eUtJTGI1VHVrL21xdFh0aFpER3p0dnhDYVdWMS9mdko0TWxCR3c4eSt6cnkv?=
 =?utf-8?B?Ulg3clRlUS9OU1VYMUNwbmxUeXlWcmZlbHZwVWFUTUcwczBLdkVER0pRMW15?=
 =?utf-8?B?Z2tKb2FDRUcybFZJbytXWWJjbFpQMWhXZzBpUnliRnlLR3BjaTY4SmJnbCtI?=
 =?utf-8?Q?eoCft0Q4uEU7ForOoNHr/Ws66?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR18MB4260.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5f5496-dc6d-41da-4c88-08dd50b0390c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 06:39:55.8012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQ21YsUlgzsYWpBKLNNoH6SRJu9Poi1r/ooq9BaewyqIMqMA77AE6emW38oJe9c+Abr0ksBasE7MPRk0Zet9ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB6018
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: beTtIM8qUhzl7tQ-11SyRKvaJxaoXz1I
X-Proofpoint-ORIG-GUID: beTtIM8qUhzl7tQ-11SyRKvaJxaoXz1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Wednesday, February 19, 2025 9:00 AM
> To: Shiva Shankar Kommula <kshankar@marvell.com>
> Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> comment@lists.linux.dev; Nithin Kumar Dabilpuram
> <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> Bhansali <rbhansali@marvell.com>
> Subject: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
> indicate outer network header offset
>=20
> On Tue, Feb 18, 2025 at 1:=E2=80=8A25 AM Kommula Shiva Shankar
> <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> wrote: > > This patch introduces=
 a new field in the
> virtio_net_header called out_nh_offset, along with a new net device featu=
re,
> VIRTIO_NET_F_OUT_NET_HEADER.=20
> On Tue, Feb 18, 2025 at 1:25=E2=80=AFAM Kommula Shiva Shankar
> <kshankar@marvell.com> wrote:
> >
> > This patch introduces a new field in the virtio_net_header called
> out_nh_offset, along with a new net device feature,
> VIRTIO_NET_F_OUT_NET_HEADER.
> >
> > Currently, drivers lack a dedicated field to signal the start of the
> > network header to the device when performing checksum offload and
> segmentation offload. This requires reading packet, which significantly a=
ffects
> performance in datapath.
> > Additionally, some hardware implementations requrie knowledege of the
> outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.
> >
> > To address this limitation, we propose splitting the csum_offset field =
into
> two 8-bit fields named csum_offset and out_nh_offset.
> > The csum_offset indicates the offset value from the csum_start and
> > may not exceed 256B bits(2^8) for protocols that use a 16-bit one's
> > complement checksum
> >
> > Following table lists such protocols and their checksum offset fields
> > within their headers
> >
> > +-----+--------+
> > |Proto|csum_off|
> > +-----+--------+
> > | IPV4| 10B    |
> > | ICMP| 2B     |
> > | IGMP| 2B     |
> > |  TCP| 16B    |
> > |  UDP| 6B     |
> > +-----+--------+
> >
> > The out_nh_offset represents the start byte offset of the outer
> > network header from the beginning of the packet
> >
> > This issue was briefly discussed on the mailing list in a different
> > thread, which can be found here
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_a
> > ll_DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2-
> 40DM4PR18MB4269.namprd18.pro
> >
> d.outlook.com_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3b
> CCyFq0M
> > EWPS2176D_oSryc7cD-
> 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_
> > nHyksxDbHI3UT0OFedi-b&s=3DMR9AX0Md9PFbZjQM-
> bwJAmO13ZwETRZJCm9qFIYDy6E&e=3D
> >
> > v2 -> v3:
> >  - Rebase to virtio-1.4
> >  - Addressed pending review commnets related to wording.
> >
> > v2 -
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_a
> > ll_20250128142152.3662988-2D1-2Dkshankar-
> 40marvell.com_&d=3DDwIFaQ&c=3DnKj
> > Wec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS2176D_oSryc7cD-
> 0TRPs&m=3Dja
> > jIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT0OFedi-
> b&s=3DjvYZB
> > QtOwWyydI5lFvCFz4hF94jDmU70nROTU44Ma0M&e=3D
> >
> > v1 -> v2:
> >  - explicitly state that the out_nh_offset can be set only when a valid
> network header is present.
> >  - updated out_nh_offset usage in the RX direction.
> >  - minor word cleanup.
> >
> > v1 -
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_v
> > irtio-2Dcomment_20250114171636.3175670-2D1-2Dkshankar-
> 40marvell.com_&d
> >
> =3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS217
> 6D_oSryc7
> > cD-
> 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT
> 0OF
> > edi-b&s=3DrzyoQrmZTznG5V9N03u7bpPbG1uQC0WPFmypJJKS9r8&e=3D
> >
> > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > ---
> >  device-types/net/description.tex | 37
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index b546cd7..2a4aa66 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types
> > / Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> handles packets
> >    carried by a UDP tunnel with partial csum for the outer header.
> > +
> > +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start
> > +of \field{out_nh_offset}  value. Device gains advantage by not
> > +reading packet to calculate outer network  header offset
> >  \end{description}
> >
> >  \subsubsection{Feature bit requirements}\label{sec:Device Types /
> > Network Device / Feature bits / Feature bit requirements} @@ -592,6
> +596,13 @@ \subsection{Device Operation}\label{sec:Device Types / Network
> Device / Device O
> >          le16 hdr_len;
> >          le16 gso_size;
> >          le16 csum_start;
> > +        union {
> > +                le16 csum_offset;
> > +                struct {        /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> > +                        le8 csum_offset;
> > +                        le8 out_nh_offset;
>=20
> Need some explanation why reusing csum_offset is better than introducing
> new fields.
Our objective is to preserve the current size of the virtio_net_hdr structu=
re, to ensure compatibility with the existing header size.
(unlike other features such as hash reporting). Given that the csum_offset =
represents an offset within the header and may not=20
exceed 2^8, we propose utilizing the existing space to accommodate this new=
ly introduced field.

Would it be more prudent to add a new field for this feature ? Do you fores=
ee any issues with this approach ?=20
>=20
> > +                };
> > +        };
> >          le16 csum_offset;
>=20
> It seems like it needs to be removed.
ACK .=20
Inadvertently included in version 3. Will fix up and send version4
>=20
> >          le16 num_buffers;
> >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
>=20
> Thanks

