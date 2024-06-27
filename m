Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF71581E1
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492358; cv=fail; b=CF2u0y0EDptff63fCV6XZO1z19axKz5KwjJD3hlmoNNq7h0d0j/S97+hREIK7AtqEWOeVXtgZiACvPgBFBpuXVJs5yDvD7CWJ2jLyIx6dSIs4x4kI05FFjHBM9sy+4o0hk2XeIOoobr7KyTyBFSiPVGQpR0/OMF+ooq5Ih30Xns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492358; c=relaxed/simple;
	bh=8vR4mNRFANowjefVTzWPntzwtqHrsxPQqfOavaCA9iw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ji6CLuPISWZu7IEp0Xia591LCaIKRpg2SnDXXOBxPVMUqdQAKMJCpWEcHlh+4fU+QcuXVBRprhMXJFOiuPYulwML02095QzD7YUXuG/8HQTKFOhh/unxm14QVv/swTbzcFNmgD+CodAAJFjy/ajisR8q5IKGLsGj6cYNuh+j8S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mgk5gQ5E; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mgk5gQ5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaHDU4y/rF+cP16sYv0X3MpDO4ECQ40kUoBLvOk0RG1q/agogFz3EW63V+8Lt4viMezzXA0cPG70JreD1TWFn+L5Jkq0lE+v4WKNpdfVAoeNn0qNlFB5k3ttE0euXgSrOfuIS2BK691TpR/tKpgTEUa649/eM67C5MCUNeg3LBrMOdGg8qyAWZf8ufwjSRfwtGKqceMvPjjQHBP5tS1juJ3UnRXSAmcw3oB8uYoWWRCYndpP462bJk8OFCccl6AD+2uyQL+CYeiW3fZT7kPgNuRFh4iEDiR3qNevSRghYcVDymyd0S1q2lA2i0TfVL/Duiw997a2NPlaajlnr5pXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEnmLrw8rBM0SnODJnmObVQbUZzJlni0hAXAqbRmhK4=;
 b=YnS2TbZmcz5lfXxDOp7M2fOMeKjMTXsCE+MQ6K+bFUFet1kjLv/o/8LoamrahycBwNKBid8+6fFznxuRoeXHxWLeEKgdK6y6VkU7HJ3XHL9uCVzwJvC9jdfn8OPFIL66DP435kV3CTn0NFoTOEa1QZVFZxh7AzkJCEj191h9wDINI1E+H1XZzUxBkJrOlpQrqUxGt8LWgTIfUKlHsGaxED/pnHw1sb45Sn8MQiBFa6UIRc56HUSiYht7+I/N3TF36WOlsbf1OsG6GEAkG/jyqUfbl1u+bLHdiTYfl/JsAKFXfCHopOI117Ez4DQGq5MantTAGlPKPwWEDtk1r5KKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEnmLrw8rBM0SnODJnmObVQbUZzJlni0hAXAqbRmhK4=;
 b=mgk5gQ5EWanhn0qH3n4YPGTRIQvMJ7l8yKiUJ9HlA7dwfCMGh/xil5kempmi/0gGsFRkd19doYknvjUUgWIRIfC4xTDHlphpYsBnMfA7rDwUJvG/ifRD1JYACthc6VM7h0GsBJxFbOXFNoBhWEnsLI2ou4pcUVEP0lt4ph+II6zrdkb+k0T0cwiG16Pl7oC9mPv/c76ece+leBB6epFD2H7rExZk+0pQpIXHhPPUg4dAYt/EmHABrFxI5ob70UPWwVSvwjOvKCyoUiSXUeb6fh9sG9o1JFgiYZETaH4G7EPpxw3w4roZ/fAyRZhPsgJHUUZCz9X8o8IGLrU3GA86Lw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 12:45:49 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 12:45:49 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
CC: Si-Wei Liu <si-wei.liu@oracle.com>, Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Topic: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Index:
 AQHasLoaN9ph3vhoUUGX8SYFd1DUAbG8yd8AgABtagCAA8+PAIAADeSAgABwqwCAAPC3gIAAYYKAgAAUBtCAAmSdAIAGCjaAgAFhA4CAA602gIABKGqAgAAiYICAAVWGgIAAHi+AgATuKICAAAse0IABSmaAgAIvtgCAACDlAIAAAe7A
Date: Thu, 27 Jun 2024 12:45:49 +0000
Message-ID:
 <PH0PR12MB54810E5C9E7B309C5A296F7CDCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240627080346-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6348:EE_
x-ms-office365-filtering-correlation-id: 5fe55799-8c8c-44e7-b463-08dc96a71285
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nmWY0r0t/vZAiDT6bLf47+Pc6XEA5ywO9I6EcbBbWFien28I5WwVIRhYQR8T?=
 =?us-ascii?Q?N/kU7zER9jCnEuMjqRpXgzZe5/nmrMd0pb5tH/AS7Tl6MUjgya68sKYi4QVL?=
 =?us-ascii?Q?aGdv1rzi/i3o7fIdW2R3m7Q5OaaW8B08P3GCUEL6QN7nrs2ONHMLa5MD2gUf?=
 =?us-ascii?Q?CT0z1AmiPz585LifWb7kPB/T493AXXXJN2QUYn6InAsWRGpt3DGggA9ID60m?=
 =?us-ascii?Q?mTWxZ1Wi76YDeWalAGn2b75yZxdaD90cj1TsW1Sx+TeGpJ2lD1bZk9e0w5/a?=
 =?us-ascii?Q?X4E2X7NpyXHUcPiqXEisqDIo1pmqxxULoX/p+RiYFgnGd6bu1alfIlh+Gzsk?=
 =?us-ascii?Q?5lhmKj3MnZkM3gsFPniXc1thjJUwNM1kHutnJIKFfy1H6eHKqR+cn0p9D6p6?=
 =?us-ascii?Q?SDKfowZzEhzFUrDqB5Myhvw5agBKkT2JvhTYaKrBLfkZHIX66mfNTkRidP/X?=
 =?us-ascii?Q?CoOEBGHlTerv1WCxFEHty/7BroDtRiedLzrK021yOdZnPG+LceB9SRL7ta8V?=
 =?us-ascii?Q?rnP+8QvNRicTZRMZQizcVnWWFG9B3y1KbpQ0gL5Ndj/Kppgx8ppkvnK85hfi?=
 =?us-ascii?Q?Z2qcodVaMUYmYmVP3Pi0CGg6KdTcuXnVx9PXMFENVREDpHziCpUwhkk0ZEgQ?=
 =?us-ascii?Q?Z1ufqYsmT/LXIR0TVIcM+mL5caUe59vyt9BkHFiRtiDAB2rx8rQ0Ldrd0XdY?=
 =?us-ascii?Q?bcyH6Z9TQ6wMur4QhSLBz3vYPOwrOzOdSzrMeeD2K4a3Ct29x0E2Vrs1hgyJ?=
 =?us-ascii?Q?xT0dz5UZkOY2F/ZhBoPpaHQoEHxAMMpd6Xi+RCYjTNL6YZKyjBSmJVaP82Z4?=
 =?us-ascii?Q?XfEwCqGVQ/VmfmPn34yJ1leXPaDWmZmy+ImScUVMzz9PXipOewNBAuLXd6Z4?=
 =?us-ascii?Q?o2V+t3XGC9uvan1Xhfto8o8GR5xPYRIwDEMKI/096JGxsaw89+RfPlRs1bCh?=
 =?us-ascii?Q?62S/ZHIhws0EIDT1AKQsgnVpyDS2kUa0QirtkfsJvM5gZRmuTfdHKuilka5Q?=
 =?us-ascii?Q?oK8AcN4VqfGpcJIPiL7jf1WVBc13BGYghHxRjFBBXxGsZls/0c6dxyeByZzQ?=
 =?us-ascii?Q?mqygKahrLrJBZRmRYiOB6v/h13A48N2t9dcyO95sb4aqHjzfaIRJ7a5bu//E?=
 =?us-ascii?Q?pAN2cTbZX7duaJirH6inYkVoqU7xjvq0dohlZ6NPnsH8LrFuUU5LEZqs3Lrt?=
 =?us-ascii?Q?FhYjQetb1epR/7sY4Td861zADVW7G+64qYoIRyyMcijNkyTFFseLjX3UyBn1?=
 =?us-ascii?Q?gG90dA1zKWFBLixdpARvXHh9uT8VSkYqWG+gPPwGWl8JCL1fjj/olhT7EYkd?=
 =?us-ascii?Q?HHAvqlc5YsTz9dheIsQuUUbuw6mFRNAhtzR4FrNx9Dyfk9p1Xehqxj2o9Mv2?=
 =?us-ascii?Q?BusOI5Raw3qj1VjD/eMpCbB71CcQKuU8eC6CLfhoV+HiutVasQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HC8C94bsZ8v6+S/hHWBV3HWBsOrqJZV7mSyZmnMwSTCVLJPpBwEC3qSuXZFl?=
 =?us-ascii?Q?cGWF3KcLr73EBC1bz7votAGgP68iGgd/vH8XbSchazlyV1D3uZPASvo9gHqD?=
 =?us-ascii?Q?97IaNjRviEQ2vHH/YcGUqmKwk89e4cuj4MsqEvNMLDpvs5pHsjzqtd5lS/A1?=
 =?us-ascii?Q?yjagqyAONIEmxCvoNV+UvYVDK7X2a0uZD5hUzxrkK7CnVrmeE+aOi/2yN0LT?=
 =?us-ascii?Q?4frJZEsjg68U60/LjmLMqzR9undeMSVx9iiBQtlAB48YB3bCQH4H5itz8jRe?=
 =?us-ascii?Q?meeK9tKKNEnp8Pv01MtIce9MaCfrUdfaB+tC+sTjPKl4uQN6J0OHdzrEFvk6?=
 =?us-ascii?Q?4kUeyG726N1NTMekMZ/Vz7dngl9TBdQazncfVWJ5lm+0q29EE+smZDMtxy9W?=
 =?us-ascii?Q?/euSNxlYcjgUE1U9cc6jcSIC0KcDJ2Ku9Q2azRjAJBaEtk0QYT0sNV5Z3VOp?=
 =?us-ascii?Q?A/ma8nhDUdUD/0vsIK922bSrATnMBlC6ta7f/ITfLwv90kbD990/i/9noHCx?=
 =?us-ascii?Q?yzoMyCyjh6b77yTwrTJXGXpSX2mvZkBMsTmKBqyWvDpZ3L9ttNgupYewwsRi?=
 =?us-ascii?Q?t3UrfuxJy+gbtIvCpTFW5t5rkUWkRgYvcR+kwmsaBKflBCzZ3k4XI5BW+mXZ?=
 =?us-ascii?Q?IorfSM5VVMCvefxcibIcZNMFilEd491usSK7XIG301pIpsCawSnK7SC7xjES?=
 =?us-ascii?Q?UY6s3kp740fpWt9IsKzDRN++fQApE11U9b6CkMhNVgu80I+SnPsKeMOnv185?=
 =?us-ascii?Q?LDyhX/pECCMDKlu6rq9hKbA7d15yk84SVPgv2Qvs+5QSI4wggqNaC+EQy2bF?=
 =?us-ascii?Q?8yFxD1LyMwSF9RxOMoB88P0hQfiwSapeQzid/wA80Q/Xjz2pmR3FfBaeLQTf?=
 =?us-ascii?Q?F28EBIPJbpDAxYtt7JrPVVW9A3I6+ba0iZZcJt4Q1OOTWhF+lM3Ke4PLw/++?=
 =?us-ascii?Q?XEjrmxWgOuI70A0fLdzBXyuUBqECMlCrbuzdhbR1lf6u20ii/Y4JrlsxPwvo?=
 =?us-ascii?Q?UjLadHDhMWPhSoM8eTUyHR7UY+lWUVLJQoxbmeSRBoZb7rTDoDv9YkXY/lSH?=
 =?us-ascii?Q?+Tshp3wBXVgQLLX2NjiTX9R3l97cCNubF4hFIFsXNk1x37Z9RCg5dRwPwK8g?=
 =?us-ascii?Q?M1bzx8y+9TlJVSl8akITt4kKv2fO/HHYfsGsgsfLGPySgw4+seFGCqVLwAlA?=
 =?us-ascii?Q?sZnyFdFheV99EnvbazP3a9rW+pWp2GB3u9p/5auudpnQd1nWC0tV7Jws1Fl7?=
 =?us-ascii?Q?NtT9phw7+yPrNZ3zkOWjESxBQbWcKeuSY4YO1N5pN6qRe1rUjiQfxeOuYXlo?=
 =?us-ascii?Q?GHFzTXEyQde/RZR0DRGPCqHVy4cHgEoKG+cYXM57L/y5ptgQgbXU0IPV0tcK?=
 =?us-ascii?Q?CG3leThnu9UvciGtUnBEQXydBqLLOmlnN+Rqj5kb4Wms7VosR+Qw1T2fwZqZ?=
 =?us-ascii?Q?9uTLNakOoGtHiehRU+VJEr6Te83FdxmIWj/tGFF+PalmT1hiO1kYCzJIk51+?=
 =?us-ascii?Q?VaCHnAkOa/PInH5a+MyUQ1Pfo2aFsg+HnQU9K4UB6sYUXB+bDmFhEMFHaj+r?=
 =?us-ascii?Q?eh8Lwsit9Vg1AS62WBY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe55799-8c8c-44e7-b463-08dc96a71285
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 12:45:49.4092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5b9EpSWVQ9JNx5O1lBXd7xx3tG4DdhhVO+ZvJUq6Chb0NbN89whEluXmBSlQTYzqMUX0foCHrXQOVe6tsvFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348

Hi Michael,

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, June 27, 2024 6:05 PM
>=20
> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > On Tue, 25 Jun 2024 18:14:15 -0700
> > Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >
> > > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> > [..]
> > > > I saw the need of this proposal slightly differently in the discuss=
ion with
> Heng in v4.
> > > > The way I understood is, proposed relaxation enables below Linux dr=
iver
> flow to work as equally as without device offering
> VIRTIO_NET_F_VQ_NOTF_COAL.
> > > >
> > > > Flow is:
> > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL 2. The
> > > > virtio-net driver negotiated VIRTNET_FEATURES that has
> > > > VIRTIO_NET_F_VQ_NOTF_COAL
> > > >
> > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not
> applying any coalescing on the VQ, in a good hope that driver will perfor=
m VQ
> notification coalescing.
> >
> > I have certainly understood this differently. When
> > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not
> supposed/allowed to do any interrupt coalescing (notification suppression
> may still apply).
> >
> > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > to/MUST do the coalescing according to the parameters as described by
> > the virtio spec.
> >
> > Michael, Jason: Can you guys weigh in on this?
>=20
> I still don't understand why this change is needed.
> We have this text:
>=20
> 	The device may generate notifications more or less frequently than
> 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL
> class.
>=20
> and
>=20
> 	The behavior of the device in response to set commands of the
> VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> 	the device MAY generate notifications more or less frequently than
> specified.
>=20
> So with no spec changes, devices already can do what this patch says they=
 can
> do - send notifications less frequently.
>=20
> Re-reading this spec text, maybe the confusion is that it mentions set
> commands specifically? And it's also stuck in the middle where it's easy =
to
> miss.
>=20
> So it would seem that the following should be sufficient, and it looks li=
ke a
> small clarification we could just apply and include in the vote for the c=
sd. What
> do you guys think?
>=20
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> ----
>=20
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 76585b0..d6788df 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1711,8 +1711,6 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                          for an enabled transmit/receive =
virtqueue whose index is
> \field{vq_index}.
>  \end{enumerate}
>=20
> -The device may generate notifications more or less frequently than speci=
fied
> by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> -
>  If coalescing parameters are being set, the device applies the last coal=
escing
> parameters set for a  virtqueue, regardless of the command used to set th=
e
> parameters. Use the following command sequence  with two pairs of
> virtqueues as an example:
> @@ -1726,6 +1724,9 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  \item Command6=
:
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} =3D 1, the device
> responds with coalescing parameters of index 1 set by command5.
>  \end{itemize}
>=20
> +The device can generate notifications more or less frequently than
> +specified by the coalescing parameters.
> +
>  \subparagraph{Operation}\label{sec:Device Types / Network Device / Devic=
e
> Operation / Control Virtqueue / Notifications Coalescing / Operation}
>=20
>  The device sends a used buffer notification once the notification condit=
ions
> are met and if the notifications are not suppressed as explained in
> \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer
> Notification Suppression}.
> @@ -1798,7 +1799,7 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  Upon disabling
> and re-enabling a receive virtqueue, the device MUST set the coalescing
> parameters of the virtqueue  to those configured through the
> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
> any RX coalescing parameters, to 0.
>=20
> -The behavior of the device in response to set commands of the
> VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> +The behavior of the device in response to specific coalescing parameters=
 is
> best-effort:
>  the device MAY generate notifications more or less frequently than speci=
fied.
>=20
>  A device SHOULD NOT send used buffer notifications to the driver if the
> notifications are suppressed, even if the notification conditions are met=
.
>=20

Your changes above are good and they are applicable when the specific coale=
scing parameters are set by the driver.

The issue that is being resolved is, when these parameters are NOT set by t=
he driver, when feature is negotiated.
What should device do?
The parameters are not specified...

The spec says " Upon reset, a device MUST initialize all coalescing paramet=
ers to 0.".

And Heng attempt is to clarify that by adding a changing above line somethi=
ng like,

"when driver does not set coalescing params, but have negotiated the featur=
e, device may generate notifications more or less frequently than specified=
".
