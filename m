Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9EECC
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 05:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477359; cv=fail; b=WHp1SKmsIVf/SLorvAuNX1pqbIoQ4N/GEY75LNPQ93/oFQzODD4S39ceDgsIKni+aNEznL5NcEmTwkZpkSGXkSRS6D6LHj+MPtUWWx8nwc7pROiggOPTfMhNPJ0c43h/+st7Rv79MLPwU5Tyjls3g7stnbA7rb3inVW4AMca8IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477359; c=relaxed/simple;
	bh=vf9oRuNcE0TVQj71+sUYU928STlRPX2XGrfbsTHNp2g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t7DxtHrLmc7Za4eu+CbxdJPiPxiLfL0D/BjQDRT+1SdFC/u64iiEYtO0Iph78ToQ/qd/vwNacc8ymQSn8KcVWnaen7S2glhmuSyiBFGgxuGVDFyP8gFJGp6XrYxzTXQgFT7ixQKdYt8RSaSBb+OCDFK2GiMTFAF4zwz9YzWzEAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hYkFW3+8; arc=fail smtp.client-ip=40.107.101.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hYkFW3+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4i/0G+sIaH4WRy2ewX/bxCMdhAybezfoS+lBNW3ReurQO01vNVfryVa5OizRILpPykiggbAjFcTvTHA484vRxCIBHeSs9cfhVKzNLRrQiHIjFXgp6HEdN/DAoi2jVMQoi+jnvxl74QYb+rOjnSj6O/I4way1C+u1wP29D1smht0tZMe2YQXvy8R1k9GT4x10Lpu5tHtjcYyYJu3nE3tvhfE4K9pEjGIS1e+Wcnkf1yBKU3cBl+271b4Z+L5+i2na8bMcwNdTqZCBoDPILu16gOHiQaKg0A58SdZCCI/2CQCwWZ7csy7oZ8XpSmsYrgdu2jczwEFDpnsf/wOMv9s0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peZ/NzpH4BYK9pe4DfEZKqWf0iWBdjjdpqSs05lu/JM=;
 b=fF+kQWs9ZvJwqIHPMvqyOy2XskFhCz47tm7EJGfAEpNNlHuS7+zZckVNBTI3vP9HI0XA4eEG+lkdpsat8xrTf8Sdmis19V5AondMB2CPlH8r52FdiKqwuETe/8HmMIm+llwgsNtUFr9Z0f2E6xtWY9IZg37uV04JiNQnXdunxvNhKI2XqGqgF6RwKzsv6032uOglL+V4773T8WtG9R9ybaeSP06pr6STIlCvFmR1LzX1/z6kqSV5uhEOqU0TfNuap/HRg9TIDn+V0IH4PnHgWBWgohqRAi3vKb7tStzizJokZdR8/Qimym4qBt/xHKj/dmrLheS7bGp8/vRzWpUtNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peZ/NzpH4BYK9pe4DfEZKqWf0iWBdjjdpqSs05lu/JM=;
 b=hYkFW3+8iDw80HT13VvFE7Z3mXECYr36oiE/C7PkvHNrIoPl9z0UMCl7hJTCpbDKbA1ByOjj/L86cNKAEDcEWv8OLRHNnqJkNONERV66gWWaNjqgzTfBDjtGnh1cPUa1VMuBdbjI49isuOK9Tl22z7w9kKLOerqMi2VtH+KXFfn//aehRRVzQECWuJEkViQ1QruYvsP5ttOdOaZSDN8Av9YqcXpITeAH+bTrXp8cBNV1nFODfZi2PufwzOHCG/++STx+3x8S8+CutGNZhL15gBkE9Hxy4AAWKv2LhPjZdJ/LDxUZczn+W4KPD0F9ttSFBu3qWRkouvlLZDA++J4vhg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA1PR12MB6946.namprd12.prod.outlook.com (2603:10b6:806:24d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Tue, 4 Jun
 2024 05:02:34 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:02:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Topic: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Index: AQHaq3q0Gsnp+nPJnUOhT0EMa0vfXrG20ImAgABF6bCAAAimAIAAAQrQ
Date: Tue, 4 Jun 2024 05:02:34 +0000
Message-ID:
 <PH0PR12MB548160963E3013BC4116BEFFDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-8-parav@nvidia.com>
 <SJ0PR18MB44771AD893EA425C0A486692C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481063D81836C1B063AB41ADCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB447735575118111B35A11DEBC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447735575118111B35A11DEBC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6946:EE_
x-ms-office365-filtering-correlation-id: e059b410-d85b-4b9f-daa9-08dc84538bf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SnfOg9i5q3ZzCejqo/hA5K0mp1PX21cp1K2ukgWQIcl+F6h9U3cDE3E5vtO/?=
 =?us-ascii?Q?EmTxnxBmo1f3tO9uw//i+SYkluxfWk0ETDMsqn0CwU62AUV4uc2FjYGerWvr?=
 =?us-ascii?Q?xFWTa/yVEZBtdetOC1jsiKP8YBPMlVY1FNUk9TXiCdHYIDZGDVuOBhHOGEcN?=
 =?us-ascii?Q?kj0SM5hAn6h5kXmrnmltpAajCihmTH2+Rq0fBUHwj5ZAex0xY4a+p9wDbuw5?=
 =?us-ascii?Q?wK0kL1y0wQqNLY7nFyqZ58eNeK2x8XmUi+kGSWw9nVKClVZfAlO7xU1fd4Bx?=
 =?us-ascii?Q?k2SOVRSIYXXHYFKkipRktw0u2i2ul/pYsV9iQcXCX1etbHXLb9IT9ypSNPKv?=
 =?us-ascii?Q?KE7XB20haEKfNiwsSv+WWTxbFXxbMSrRPlxlbPc/vbEaxnC5NHZOGUs9PI7H?=
 =?us-ascii?Q?V48hLBCK6QPoT6lozuyzb1ujGSJmwkc6iha5BmnvLdxiNXN+0+ahJ0RijoJm?=
 =?us-ascii?Q?5n6h74o8Lfjn6l0iDVl9qjO8mrOIBNm/5VJC6j/C1sani9kQHlxMsimkH3aa?=
 =?us-ascii?Q?VnPWBu9tZs2oLpX+Wn4vhuOk9wG2VEzfUTQmuTAFwzN4ymFUdM13ARmUVmzk?=
 =?us-ascii?Q?okdwiCS9v7sMwZK0IHtdpvnunM/oX+utIYjqd/AqNIAPNM42wkg+q+pAu/I3?=
 =?us-ascii?Q?lewwqYdpPNg400x0puCZR9cbP+yuJR53yZjGmn1+3HfgEXgS+NoPDNuCBH0z?=
 =?us-ascii?Q?2iOiXdFZ72aFSPWTJUKOfRW4gTLipnwd/Wa2EGOv0NmWjtirOcC+tACycz2E?=
 =?us-ascii?Q?gh8ACt1qCxzF4S3gL+Ey/4OhbgxaPEEP/D657kkVBFI7Tlf05Nnhuuipic2o?=
 =?us-ascii?Q?5OGibiXWC5lYneNL9Y4oNLmJoQpmAr58v2pWipdMMv2Xf1Ttct6/WipF7q0L?=
 =?us-ascii?Q?ZoVGT7B2i0UBG4Msi/zLDMJKVN6+0SNdY9kt1BcZljCYa6W2HhLwKY6+2eA6?=
 =?us-ascii?Q?WWq0dCo7tExPSe4s2Coedf6bppL6Eod2mB/jhGUvOmrIn+yBWpecDfx1U9Fw?=
 =?us-ascii?Q?y+1WgQBjJ16Zeqcb4v4FBCcHWjvAEn4ZYkFzsFJprc/KHtMdl7O2EblsmxeB?=
 =?us-ascii?Q?dzyOdkJFLvpxvwwMxh6uteR3ucft4eGTXfcoqHL5AagE6O6CYBQG+mKr8Kuk?=
 =?us-ascii?Q?tKtb2pr/ZmsBQYmwcGg9DxvfVHTYplPEK9E4z4rO6h2QjC7D33x1MjU1Ctm2?=
 =?us-ascii?Q?LU6qOPOj3Z8UJLrQJ81Mtl/OQk+vvPZjOqWJwtiPTxUHGjUx/u/amnSOfN5v?=
 =?us-ascii?Q?lk+xZ6C1CdEZ8/Hf1/UnBVZRTabwsUDaMZBfY9FHojaSI0+nI/XPjR6MzaAd?=
 =?us-ascii?Q?5hKuh/VkvSZSYWCvL0UGzUFYR2P27LY+8zUAMcxTxblK7Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aKu0fvvtNSC7yHm1YEIOtuEnnaFxack6EhV9CxJe1dLtx6fV7wFDsZIgNM1Z?=
 =?us-ascii?Q?udcAO//wmyzXuxVNN/mlojmE6DURXXyyCrLf7S08lD9H5Qzeikt+WQVqmiRW?=
 =?us-ascii?Q?Pyyz4MGPfW2EF6z0jsBiDpVRibK8cHKERaZooWKTlram/qpQapzDoWdFcRfQ?=
 =?us-ascii?Q?uLfCk+s2IXYFwHSOQoO6dza7VP4rmRhxDOHl8tZt7hD1jGuXJDmvk8T18DUB?=
 =?us-ascii?Q?0b47Lg7CJDE+251B5Ie3Anp1HuG3lOBEy0Kp0xJGBWU7rq0GbAPWQxsgQQ+V?=
 =?us-ascii?Q?jvyvGvK3F20yPM43Afzwf6jdh15eq4uQTYms972ksMmv7MA0v5fxovqvaeD7?=
 =?us-ascii?Q?VPprPU7LL56aYfesUnl+ix1GRK18rpZ0t1WjP+dlb2PgVBw9n1GnBUchGmP9?=
 =?us-ascii?Q?Jnqjbbtpg6ShUi61fQLgc46pOuUC9CL4vsj0Qr0criyvh0ZjWiQsHr/9mdlS?=
 =?us-ascii?Q?ST02lncO/EQVHrO4CsaLSfXozpZO1cDLxX5rVZaMuNaY6SLAAHW/Oe9JsHuZ?=
 =?us-ascii?Q?ynn1xYO4ooVgmVk+p4nebh4dzy6cXasYR8Sy6x6sXZ31EE9UEHKLF0BrNcDf?=
 =?us-ascii?Q?L8JtIw7XpurvoRsF1O41p8M6KaKSXlGO3JPIHxOD/HCQllHMqPvlkpd2espo?=
 =?us-ascii?Q?/T9E0uK0ONyS51032igRVjelMNMB1FAxaLT4EDQbpdUFaQv88i0tJVpQESul?=
 =?us-ascii?Q?6x4ZiIC+42dMKVnaNMVobpTeF62dkgL3w7nXxu2dhYxlwRJa73587XDR+C3Q?=
 =?us-ascii?Q?h4xHta2YRRk7BcgL7JuzNjT8aW9msJXmFKqu1cKpdbxbjDCLAQTLTJodAasV?=
 =?us-ascii?Q?j8cQvESSyKsGNhMsDzGbFOJePc9ffKAx+1s5rt5Kyt/lZ4l/YkJYCmtlB1nr?=
 =?us-ascii?Q?bR//H6+i2EiKyUrNslk6d+Sl9uzbdf8PSbBmvooGmriUhxkKNcx1RnfY1wvK?=
 =?us-ascii?Q?NIE3e01ZdNCbAawyMxDaDlT6oANnM7EgxwJDmtVnTKfMANkq77NcFFG0ozIq?=
 =?us-ascii?Q?dbtZVbhLKZwdypsZTv3XqxIAB0d3ifMpYsK3Zg85f529+kb2rarRp+nWSZKO?=
 =?us-ascii?Q?+jNBsTMHL1CZIo6eX2j9c0r6og8DZckuNFKHv6UHXKTee+9rDOJXiintCmqZ?=
 =?us-ascii?Q?rHbyZbVhEDaWTqwz0+0rq6FT5moBXgcy2l1O9EwFL6u8FJzmlpab15Oyooi2?=
 =?us-ascii?Q?IQo0I/uyIbRX0Pmur/r4hX7wg1xxnizbsJOVItFhKhukvUVNRM8huCsdLMQF?=
 =?us-ascii?Q?yju35QRaO2mFQwJvVMm5/JQXHpEj4nMJkvz3xuzFAKb+cU6hXITHH4SPFgIK?=
 =?us-ascii?Q?y6WePoVdaCnp/qLnsjQzSz0RN59BB4oClM2xDLPcNMOLZ4KPgZJBUscpY7bT?=
 =?us-ascii?Q?Dm237//U9+MTcYE3XFOPS8o4c2QBri7oWe3WC+XT5L0LFzlcBOe6BlCr4HkZ?=
 =?us-ascii?Q?j9Dnto443HJGUBKGKJRlU1RLLonsPXfIDdLpVaHt+FhG8KXCEpP1xTXzGQze?=
 =?us-ascii?Q?3CrJDfp7JaUkKftBEiqtEqorvJR3EPu0lqI2M5n1aETM2xRAXfCqvM2LT3+6?=
 =?us-ascii?Q?gS/bBRtANTbsoJH7wAk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e059b410-d85b-4b9f-daa9-08dc84538bf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 05:02:34.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cK8ZT3gnl435xTTgtuR8LU6prAkwz1IJqUK1m+s3uMDThhdexKhfDIaAaPB1Xb3F98/RZQfYw14l05jTf4itYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6946


> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, June 4, 2024 10:23 AM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, June 3, 2024 9:29 PM
> > To: Satananda Burla <sburla@marvell.com>; virtio-
> > comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> > wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com
> > Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> > objects admin commands
> >
> >
> >
> > > From: Satananda Burla <sburla@marvell.com>
> > > Sent: Tuesday, June 4, 2024 5:41 AM
> > >
> > > Hi Parav
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Tuesday, May 21, 2024 5:30 AM
> > > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > > cohuck@redhat.com
> > > > Cc: hengqi@linux.alibaba.com; Satananda Burla
> > > > <sburla@marvell.com>; shahafs@nvidia.com; si-wei.liu@oracle.com;
> > > > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > > > Subject: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> > > > objects admin commands
> > > >
> > > .
> > > .
> > > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > > +Group
> > > > administration commands / Device resource objects /
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > > > +
> > > > +This command creates the specified resource object of
> > > > +\field{type}
> > > > identified by the
> > > > +resource id \field{id}. The valid range of \field{id} is defined
> > > > +by the device in the related device capability. The driver
> > > > +assigns the unique
> > > > \field{id}
> > > > +for the resource for the specified \field{type}.
> > > > +
> > > Is the valid range defined by device capability or driver capability?
> > The device indicates the limit in the capability.
> > The driver uses the capability to set same limit or smaller limit.
> >
> > > What if the driver has set the resource object limit capability that
> > is smaller
> > > than the value published by device capability?
> > >
> > This is fine. It is allowed.
> > It is captured in the theory of operation section of "device resource
> > objects".
> > Snippet here:
> >
> > "For each device object type, resource object limit is defined by
> > field limit using Device and driver capabilities.
> > Each resource object has a unique resource object ID - a
> > driver-assigned number in the range of 0 to limit
> > - 1, where the limit is the maximum number set by the driver for this
> > resource object type."
> If so, doesn't the valid range of the resource object id get reduced to
> 0 to limit - 1, where limit is the value set by the driver?
Yes, but the primary limit is what is advertised by the device in the devic=
e capability, the driver can reduce it as written.

> For instance, if the device has advertised 10 as the max number of resour=
ce
> objects for a given capability type.
> Now if the driver has only set value 5 for the same capability type, it m=
eans
> the driver can only use 0 to 4 as the resource object id in subsequent cr=
eate
> commands and not 0 - 9. right ? So the valid of range of the field id is
> determined by driver and not device ?
Your example is correct.
The intent is to say, the valid range is defined by the device in the devic=
e capability.
If the driver has reduced the range, it is the reduced range.
In other words, the driver cannot create an object with the id >=3D 10 even=
 when driver and device capabilities are same.=20

The part that "the range is reduced" is captured in the capability descript=
ion:

" The driver sets each limit number field to a desired value that is smalle=
r than or equal to the
value the device presented."

Because any capability that device has exposed, the driver can always reduc=
e or disable it.

> >
> > Combined this with below description from the theory of operation of
> > the "device and driver capabilities",
> > Snippet:
> > "The driver sets each limit number field to a desired value that is
> > smaller than or equal to the value the device presented".
> >
> > The device exposes maximum limit in device capability that driver
> > cannot cross.
> >
> > > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> > > \field{opcode}
> > > > +is
> > > > set to 0xa.
> > > > +\field{group_member_id} is set to zero.
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_resource_obj_create_data}.
> > > > +\field{resource_obj_specific_data} refers to the resource object
> > > > specific data.
> > > > +Each resource uses a different \field{resource_obj_specific_data}
> > and
> > > > is described
> > > > +separately.
> > > > +
> > > > +\field{flags} is reserved for future extension for optional
> > resource
> > > > object attributes and
> > > > +is set to 0. Each resource object uses a different value for
> > > > +\field{flags} and it is described separately.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_resource_obj_create_data {
> > > > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > > > +        le64 flags;
> > > > +        u8 resource_obj_specific_data[]; }; \end{lstlisting}
> > > > +
> > > > +When the command completes successfully, the resource object is
> > > > +created
> > > > by the
> > > > +device and the device can immediately begin using it.
> > > > +This command has no command specific result.
> > > > +
> > > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> > > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > > +Group
> > > > administration commands / Device resource objects /
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> > > > +
> > > > +This command modifies the attributes of an existing device
> > > > +resource
> > > > object.
> > > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> > > \field{opcode}
> > > > +is
> > > > set to 0xb.
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_resource_modify_data}.
> > > > +\field{group_member_id} is set to zero.
> > > > +\field{id} identifies the resource object of type \field{type}
> > whose
> > > > attributes
> > > > +to modify.
> > > > +This command modifies the attributes supplied in
> > > > \field{resource_obj_specific_data}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_resource_modify_data {
> > > > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > > > +        le64 flags;
> > > > +        u8 resource_obj_specific_data[]; }; \end{lstlisting}
> > > > +
> > > > +This command has no command specific result.
> > > > +When the command completes successfully, attributes of the
> > > > +resource
> > > > object is
> > > > +set to the values supplied in \field{resource_obj_specific_data}.
> > > > +
> > > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> > > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > > +Group
> > > > administration commands / Device resource objects /
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> > > > +
> > > > +This command queries attributes of the existing resource object.
> > > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> > > \field{opcode}
> > > > +is
> > > > set to 0xc.
> > > > +\field{group_member_id} is set to zero.
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_resource_obj_query_data}.
> > > > +\field{id} identifies the existing resource object of type
> > > > +\field{type}
> > > > whose
> > > > +attributes to query.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_resource_obj_query_data {
> > > > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > > > +        le64 flags;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_resource_obj_query_result {
> > > > +        u8 resource_obj_specific_result[]; }; \end{lstlisting}
> > > > +
> > > > +\field{command_specific_result} is in the format
> > > > +\field{virtio_admin_cmd_resource_obj_query_result}.
> > > > +
> > > > +When the command completes successfully, the attributes of the
> > > > specified
> > > > +resource object are are set in \field{resource_obj_specific_data}.
> > > > +
> > > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> > > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > > +Group
> > > > administration commands / Device resource objects /
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> > > > +
> > > > +This command destroys the previously created device resource
> > object.
> > > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY,
> > > \field{opcode}
> > > > is set to 0xd.
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_resource_obj_cmd_hdr}.
> > > > +\field{group_member_id} is set to zero.
> > > > +\field{id} identifies the existing resource object of type
> > > > \field{type}.
> > > > +
> > > > +This command destroys the specified resource object of
> > > > +\field{type}
> > > > identified
> > > > +by \field{id}, which is previously created using
> > > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE command.
> > > > +
> > > > +This command has no command specific result.
> > > > +When the command completes successfully, the resource object is
> > > > destroyed from the device.
> > > > +
> > > > +\devicenormative{\paragraph}{Device resource objects}{Basic
> > > > +Facilities
> > > > of a Virtio Device / Device groups / Group administration commands
> > > > / Device resource objects}
> > > > +
> > > > +The device SHOULD complete the command
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > > +with \field{status} set to VIRTIO_ADMIN_STATUS_EEXIST if a
> > > > +resource
> > > > object already exists
> > > > +with supplied resource \field{id} for the specified \field{type}.
> > > > +
> > > > +The device SHOULD complete the commands
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> > > > +VIRTIO_ADMIN_CMD_RESOURCE_QUERY and
> > > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY with \field{status} set
> to
> > > > +VIRTIO_ADMIN_STATUS_ENXIO if the specified resource object does
> > > > +not
> > > > exist.
> > > > +
> > > > +The device SHOULD set \field{status} to
> > > > +VIRTIO_ADMIN_STATUS_ENOSPC for
> > > > the
> > > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE if the device
> fail
> > > to
> > > > create the
> > > > +resource object.
> > > > +
> > > > +The device SHOULD complete the commands
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY or
> > > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY commands with
> > > \field{status}
> > > > +set
> > > > to
> > > > +VIRTIO_ADMIN_STATUS_EBUSY if other resource objects depend on
> the
> > > > resource object
> > > > +being modified or destroyed.
> > > > +
> > > > +The device MUST allow recreating the resource object using the
> > > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was
> > > previously
> > > > +destroyed using the command
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
> > > > respectively
> > > > +without undergoing a device reset.
> > > > +
> > > > +The device SHOULD allow creating the resource object using the
> > > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with any
> > > resource id as
> > > > +long as the resource object is not created.
> > > > +
> > > > +The device MAY fail the command
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > > even if the
> > > > +resources within the device have not reached up to the
> > > > \field{max_limit}
> > > > +but the device MAY have reached an internal limit.
> > > > +
> > > > +When a capability represents a number of resource objects, the
> > device
> > > > SHOULD
> > > > +allow creating as many resource objects as represented by the
> > driver
> > > > capability.
> > > > +
> > > > +The device MUST NOT have any side effects on the resource object
> > when
> > > > the command
> > > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY fails.
> > > > +
> > > > +The device MUST complete the command
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY
> > > > +with \field{resource_obj_specific_data} which is matching the
> > > > +\field{resource_obj_specific_data} of last
> > > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > > +or VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY command.
> > > > +
> > > > +On device reset, the device MUST destroy all the resource objects
> > > > +which have been created.
> > > > +
> > > > +\drivernormative{\paragraph}{Device resource objects}{Basic
> > > > +Facilities
> > > > of a Virtio Device / Device groups / Group administration commands
> > > > / Device resource objects}
> > > > +
> > > > +The driver MUST not create 2 resource objects using the command
> > > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE of the same
> \field{type}
> > > with
> > > > +same \field{id} before destroying them.
> > > Can this be simplified to
> > > "The driver MUST not create a second resource object of the same
> > > type
> > with
> > > same id using command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > before destroying the previously created object" ?
> > > The phrase "before destroying them" seems confusing. It suggests
> > > that
> > 2
> > > such objects could be destroyed though they are not allowed to be
> > created.
> >
> > Yes, looks better.
> > Will fix in v11.
> Ack.
>=20
> Regards
> Satananda
