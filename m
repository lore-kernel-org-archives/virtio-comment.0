Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327913D608
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 05:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478197; cv=fail; b=a5eGZXKgqKQY1LJ8hWZ2sJUWziG8UJ5GG1FyvizKUdf0oH58RJXzAA9awSMbL0MEOip+33nMsxvM9yGnguPxw/1sYRNDmUG/PGC4RZjYAg3TDTwEjMlAtE/qjQ3Mgh1L43sUmJ9stK7dxK4uuAd+Uph4dfWbYRTCg9/LsERUhM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478197; c=relaxed/simple;
	bh=LIvri4ewybzPbyQqDxYq0l7g6iHAuYW+EYvWvYim4Ao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HMsLu/WdkZKBV/m5kRiCNJXQo7be93GH46NIzTyfW5AbjyC3rK8/0sWnbB2LusAR91YdDi6UuHQz1Ty5Jmr4fRcsOcKEmakIwtjUvgQ/16i5OniRGCSGzcEj/+oodzuIQPr30cfDm5s10pR7yPGemSVQ2HE5QD45o3TMDCPHUlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Vi4/hHUh; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Vi4/hHUh"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453KcHqH001469;
	Mon, 3 Jun 2024 22:16:29 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yg35hfwbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:16:29 -0700 (PDT)
Received: from m0045851.ppops.net (m0045851.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4545GStI004945;
	Mon, 3 Jun 2024 22:16:29 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yg35hfwb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgTZer7r2MuG+yvjlZuMYK9LpL9cR7ZC/wwv+IgZT1Ay3UCgTYKT0lOOmiBWvWp+V0nIhbmt21Vf+KXDLTo62/CICdp9EJ79cpxBt0jxU7DBJEEwRsgmca36u/W4kQma3FjMHOL7v1v3N/ilsVymRCqyhpW6TOC3kmyYdeY0xlGoyxUNzlw/aJBgkA0p9o/YZZBv4OYvWQTuOwzR3nBYwW5qGLlhrx7XOmRdC3p6Jm4YLM22owSlWOKMUuZ+vb/7UK8GtYSZMOWaZNnR2/yuvOD78Z7TcTjXLQM9KekoVI1i1GE11U8Lp5VuY6ggnCm7WlsTkbXs5R9xMb/Y5U/QMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIvri4ewybzPbyQqDxYq0l7g6iHAuYW+EYvWvYim4Ao=;
 b=ANWGdxCP6KWfmGqHgnbZrWAsKoIz3kAIK5sM/nkiHf5upOs8o385nvI80lbJ/Z2vgtKSjI3tzQa6get0j13BZTCzKSXDBH5krFhUX6TWkO9e0cVGvLEn1SkQeWmFEzz5G7deZa04+X+vS9g7DZFbPNkS7lo6i7b5xGfKRvGZgC3omVK3SMmDHSZqeWy876pKZtxaFhKSAVYRMH2hYBobVjPeSbH4vGINIc1SaHGHZHPUmwox2haRyjopz4qwPtsYUYADv+euR70aKIhlYLGe+vBDrHD0WAYTxw7YqCKlq/cDzGD1pTwMyeQtFzPOjWATbmBzqyjwwECnUx+YhBGO1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIvri4ewybzPbyQqDxYq0l7g6iHAuYW+EYvWvYim4Ao=;
 b=Vi4/hHUhbQ8LZYLln0OdsEJXySq7G+d8rsS+2p42/4n6w89ZfetECRbIKvgilMB5uU8ZPKBAR26lYsF7fD5Gyd0wfXsUSx2DXx268q2/MegrpOrycXnbZc1WGyb0nrli0L1ERfrleSV6U1lO8qEUdJ2mKopNeDm0Bkn03e7eemI=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by CH3PR18MB6119.namprd18.prod.outlook.com (2603:10b6:610:1e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 05:16:07 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:16:07 +0000
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
        Shahaf Shuler
	<shahafs@nvidia.com>,
        "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
        "peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Topic: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Index: AQHaq3q2FshspUNOLkCO6ZOTmkCqHbG2wvvggABVmwCAAANLkIAABfsAgAACiNA=
Date: Tue, 4 Jun 2024 05:16:07 +0000
Message-ID: 
 <SJ0PR18MB4477895DA6DB98FFE83C2DD5C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-8-parav@nvidia.com>
 <SJ0PR18MB44771AD893EA425C0A486692C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481063D81836C1B063AB41ADCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB447735575118111B35A11DEBC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB548160963E3013BC4116BEFFDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB548160963E3013BC4116BEFFDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|CH3PR18MB6119:EE_
x-ms-office365-filtering-correlation-id: 7a614402-fef5-4631-53c2-08dc84557079
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?CHkosE5fxGlMXxeZpU1zgfFNOOyDdcy0BnJKMGNgzA4nKnZJmXyjEG0luJPG?=
 =?us-ascii?Q?RCzhwsjjFFmuqKwxjAKHdb2QwV1YwOBfl8UobbxbCXFLWJ8Ze1WgxW/uNPOV?=
 =?us-ascii?Q?sMA6wlFPxkS7g+7/VgBv54C8Z1nUZY/2/Q1WPNIZ1buBko4mwuUc1Tb57p2o?=
 =?us-ascii?Q?geCpYl+YQ3G4arD7nU3G4l6QnrAgrzaGpoJ0blKKyuFZq5BrXtNVltj9sWU8?=
 =?us-ascii?Q?NxHXJIQD2SNgPB6MMQoKV0FuEPfA1pz5FrJ4/nk+S6cDr+62LbAnXBHxqK8r?=
 =?us-ascii?Q?w5uaBLddbRyNMMB9ncsgNWrRFjOypyQK3as+ZA/yvuz8Vjk92rT1cO3pnLci?=
 =?us-ascii?Q?/yWXl7ZvOvMxS5dEOExulgaV4V6eCvpgd7O32bFWtLAHLRil4GxmCVD5Sgy8?=
 =?us-ascii?Q?lUdhDBkuipVeeK+2ssBqabyPa0+3pPJu8Ynuu8tpNQdz27CM1crUSGM+3Wrx?=
 =?us-ascii?Q?Qt7+c755Gj7XLKifBuS8hmVbjtbBO93jDigg//OO4vR/efOIn2u23Tr4sb70?=
 =?us-ascii?Q?CCe6OpFCvGoaGvZyMqTuMFFdzBa5QPaGwI4syFPwHivb4Xnty4oPGPa3U72H?=
 =?us-ascii?Q?e+IRFi+oUDpVN6HpDwg4HqxN4xkYoAlRUnAhZGGxDT7cvqS+yWHqg28pFXLB?=
 =?us-ascii?Q?VfV3IaBzSrHSes+hRtcf8I5eM2piuzY/MRLlmRA3jDemka/H0TGV2ufQyMem?=
 =?us-ascii?Q?A1Sp/DDqRnIDXMkVQpEy+TZ8APmpd7kzWV5ygVgcjJQJQ7+yHVc2gLgwqtv/?=
 =?us-ascii?Q?IQqalFlow/f+reFQA2wcDOT4bc729XHBLGBV6q1GFgm/CvrYcW08OY81MfPC?=
 =?us-ascii?Q?qCo/rbSTliT2/VlqpZxW2Qq1bHzwh6NS8FFlE7nOgZ3chOyY9KfzEwupObaW?=
 =?us-ascii?Q?kbMCiERmCMtwkYhE79HgC1jWftqsgcG+1QTh2Fk9X0mKvzqgXyKlL5AQgdR4?=
 =?us-ascii?Q?HJ5gy/VfaNzZo+wRUh+ehu4xP4bRLUPE147QsSMO/9jiWGc/+gLGCUDCyN4R?=
 =?us-ascii?Q?GBXhZBuOgAxm5k4oKwFAQtDCDHJWxTLTzi8HcB3Yw/k1Pc+BvRcksK/bpYl5?=
 =?us-ascii?Q?Xqo44m+hDaDJ9sAuynpwaeM/MrUqYobspFzLVOZUF8qE0L3QJfmhXpNhjiVe?=
 =?us-ascii?Q?a3u1Ix9ZHnC02cyN2EMpHKuALFrV5syCoxRQstL/JUGr2gB2N+kouYw9YyTf?=
 =?us-ascii?Q?4SPqDw6c9NfZboDgXZoNPdFbh/EKAA7XzzKpCYZf5vZl9al/7gsxziUMBA4T?=
 =?us-ascii?Q?LTWiXwMwcvLeCafxhEaFUxbb1A7NwCQqYm5ZTlPmiJWkRjU5RYLjOijXUocH?=
 =?us-ascii?Q?NeQAt7vpTdHzyyVcjtznz/nTkHWsXw2waRknFwOEQZDfVZdrwiZvWQ1mC2zy?=
 =?us-ascii?Q?E/bJHHU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bIJu8ysT+hI2H10eeUpxwNLrCcGl9hDF3bCNgVi70NQaH3VKchmc7W3tOAt2?=
 =?us-ascii?Q?o8FbT2/yvi9oIOkV+sbK+5InVR8g5iBa9PxUHPzTzIFIB2lxDc9UgwCGsmuS?=
 =?us-ascii?Q?dAWEq54FJBI3ZgTTYb3IIOFfxa47toyfcqKEwf0jjAmElRZFL5EhkLqBi5pW?=
 =?us-ascii?Q?DuRn+T18bhNvwTx/7bp6kRxvqemKSO4jKDQaDddw8aTv2zP9tltIu33kwOyO?=
 =?us-ascii?Q?vHtL26BmRNnVkvAdfQXotqgS3Zw8Q8UG90dhivTX20nHwHWVfxsYpr3o/jRU?=
 =?us-ascii?Q?yh6UHzHvUHm//7r9btgVJFmAChr7PsqXE4wZ00sAyEfo3sFAWtCQqEDU547j?=
 =?us-ascii?Q?ne6I1qEmMNEpsFQHfB1YG0a70SrQWEb+XaO2hHwGbhkyjr/ebIjW/4tz1tav?=
 =?us-ascii?Q?IvVWcxa1vgrAodMVfdD7JKLftja27Wls/hzyMzt4rDjnV7G/A8vDEKxi4Jr7?=
 =?us-ascii?Q?f8hHSpiduXyWR9RGwGBpt3tTTPfuoPLXfsGcZIA49n84V8Rkeu9KjiKu2CGT?=
 =?us-ascii?Q?6mFTBCKkflrGscr/17PV4BrCixdFev4CLhXtJxH+6A9QHlzHJI5zzRo8Uz/4?=
 =?us-ascii?Q?rx35+/NMi1d/ppGnqNSauhCAyah5MO9kIOG3HZvZ8JktsegI5so/xXjK+EPq?=
 =?us-ascii?Q?6T4FxhtE9RJvUKG9KSDq1rV2T04n4QQg8vR7dS2YrbxDBK8HnUVMzsMpcIpd?=
 =?us-ascii?Q?/QiSnKY6HU8p4zhO5pxPoUr75Jm890wc47jT6Nb3Nl/invOtj9IPgCC+0vna?=
 =?us-ascii?Q?IjSegg+VYS1gNXTUBbJn+VfTRqvWOeHy34wwy61qbGGG5Y2Gc26ZU0vcVt8Z?=
 =?us-ascii?Q?euqRDAM2mt7EC2hKDv+6p0O368tOBQ9xqLlD9GOCuURCf5/gPu0ljl+xn1T7?=
 =?us-ascii?Q?HKow2hChOHNqC6IIk/ghjrgWo8OJts9dybGLlfYh753mCm0v5+RIrKU0JAFp?=
 =?us-ascii?Q?/WjAZ6/Qhp2LtxvBS0uzuKffXFL0CbUpLl6lzuOEAS0lFQ9HEJHE06MWKmo+?=
 =?us-ascii?Q?Lx9TuhhpRbsMxP72nDDeEj969ioVPNNp54HNRr9TY+Jh98u0q0GzpO2lq436?=
 =?us-ascii?Q?lL3kSRKFs2gwkDhwlslTipIiCzSQbZJfx3e4reMYIX0l8aVg2J4WaPOS5X9J?=
 =?us-ascii?Q?5Aqz11CCTylLwSl/Xdi3P+gJNKF9VXChmjsC2MM0FWzO4JihXWmSoWmOuAim?=
 =?us-ascii?Q?E90NKhjeTfnrNHYzQJ3EOV7tkTRxryIhjvX7jVJ9MXfuCufDMAH6BsJ/WIhI?=
 =?us-ascii?Q?Rxttn3ZSIKwBS3vmowr5sgPkD4pC2jVNRRLcfHHYeMHl6z6XxKNVnKkQmguS?=
 =?us-ascii?Q?pzBn++LGqpyeeJbdAlFuh3f1vsGyoG8z0JCpPWnEBFqfTLiLrxZrNoUxBoHy?=
 =?us-ascii?Q?gyLb4ebUV0Lqr8TQdcFzOKcc3vzqU8j2FxaTgClJOn1bMOZk/+M0XPUGYyYs?=
 =?us-ascii?Q?QUBVwpaeNx1mqRiP8CRkZiXzjikcDL84eZGOm+YMjkn1kLQD7w9gcM+Cf1Lz?=
 =?us-ascii?Q?BxQCIM6eZxiNiNCdfeZwj+ifieSBDtYQ445q5T0GN8mJqLXZUIWESbl3TrQr?=
 =?us-ascii?Q?JsXaf8seVUNjizJ6aHBuJVSP02tOYZEUv1TujNFC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a614402-fef5-4631-53c2-08dc84557079
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 05:16:07.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8wHDlbJnLDh3FAZj7zhqI6444kSgsAxPSXTAI0v4TaYtAluECvi7SpqeG8IkTapuBxbmjBPwIL2wRx5BPHrxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB6119
X-Proofpoint-GUID: GHkbBrxYYXbH0rGkrk5Np57vw7mcZCux
X-Proofpoint-ORIG-GUID: _A-6k6AgfGGx4FXOyhoT99q8QPT3_2Ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, June 3, 2024 10:03 PM
> To: Satananda Burla <sburla@marvell.com>; virtio-
> comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> wei.liu@oracle.com; peter.hilber@opensynergy.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com
> Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> objects admin commands
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Tuesday, June 4, 2024 10:23 AM
> >
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Monday, June 3, 2024 9:29 PM
> > > To: Satananda Burla <sburla@marvell.com>; virtio-
> > > comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> > > Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>;
> si-
> > > wei.liu@oracle.com; peter.hilber@opensynergy.com;
> > jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com
> > > Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> > > objects admin commands
> > >
> > >
> > >
> > > > From: Satananda Burla <sburla@marvell.com>
> > > > Sent: Tuesday, June 4, 2024 5:41 AM
> > > >
> > > > Hi Parav
> > > > > -----Original Message-----
> > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > Sent: Tuesday, May 21, 2024 5:30 AM
> > > > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > cohuck@redhat.com
> > > > > Cc: hengqi@linux.alibaba.com; Satananda Burla
> > > > > <sburla@marvell.com>; shahafs@nvidia.com; si-wei.liu@oracle.com;
> > > > > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > > > > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > > > > Subject: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> > > > > objects admin commands
> > > > >
> > > > .
> > > > .
> > > > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > > > > +\label{par:Basic Facilities of a Virtio Device / Device groups
> /
> > > > > +Group
> > > > > administration commands / Device resource objects /
> > > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > > > > +
> > > > > +This command creates the specified resource object of
> > > > > +\field{type}
> > > > > identified by the
> > > > > +resource id \field{id}. The valid range of \field{id} is
> defined
> > > > > +by the device in the related device capability. The driver
> > > > > +assigns the unique
> > > > > \field{id}
> > > > > +for the resource for the specified \field{type}.
> > > > > +
> > > > Is the valid range defined by device capability or driver
> capability?
> > > The device indicates the limit in the capability.
> > > The driver uses the capability to set same limit or smaller limit.
> > >
> > > > What if the driver has set the resource object limit capability
> that
> > > is smaller
> > > > than the value published by device capability?
> > > >
> > > This is fine. It is allowed.
> > > It is captured in the theory of operation section of "device
> resource
> > > objects".
> > > Snippet here:
> > >
> > > "For each device object type, resource object limit is defined by
> > > field limit using Device and driver capabilities.
> > > Each resource object has a unique resource object ID - a
> > > driver-assigned number in the range of 0 to limit
> > > - 1, where the limit is the maximum number set by the driver for
> this
> > > resource object type."
> > If so, doesn't the valid range of the resource object id get reduced
> to
> > 0 to limit - 1, where limit is the value set by the driver?
> Yes, but the primary limit is what is advertised by the device in the
> device capability, the driver can reduce it as written.
>=20
> > For instance, if the device has advertised 10 as the max number of
> resource
> > objects for a given capability type.
> > Now if the driver has only set value 5 for the same capability type,
> it means
> > the driver can only use 0 to 4 as the resource object id in subsequent
> create
> > commands and not 0 - 9. right ? So the valid of range of the field id
> is
> > determined by driver and not device ?
> Your example is correct.
> The intent is to say, the valid range is defined by the device in the
> device capability.
> If the driver has reduced the range, it is the reduced range.
> In other words, the driver cannot create an object with the id >=3D 10
> even when driver and device capabilities are same.
>=20
> The part that "the range is reduced" is captured in the capability
> description:
>=20
> " The driver sets each limit number field to a desired value that is
> smaller than or equal to the
> value the device presented."
>=20
> Because any capability that device has exposed, the driver can always
> reduce or disable it.
Ok. Thanks, that clears up things.

Regards
Satananda
