Return-Path: <virtio-comment-return-8250-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB5C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:55:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B33242AD41
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:55:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92CC8986B5D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:55:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 795349867FD; Tue,  7 Nov 2023 11:55:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69B579867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K26ZjKIkQolXQDtymeUiPVt7R7/YEeLO6y4qeMCApptEjBftNxs0RInjFLG0N1v/vZIJPvvLY57aN1/sJC9kti+Tny3DgSBetvMPsM2K5dxjSVlrs6bvOu1TJwOStkp0RGl788zA/MLjULQStZIwDHBjlcjO1c46RrN72SxdhZGaMD0IZIOSsRN3k3yMPPyb4qseOfbdh5ioa8LKTyR+piI2uJZ216DolPVaSFtuuBcdOUstc3mPG7QpXcKwAzQqSQ0QUhazKjHiBkeCf3GtSQYc865U/FWQxiKZm3pk8KS0S+xUq89NQPDoZeElDZD/+gwLBLwx3yCvWia7ek6GNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byv+F6dHRDtDwxbiBiwU7MwJW9VyszdLrMbWQN0EZv4=;
 b=DZqACVj1zAUq81Ju5n1Fo69cwYAcsYlmHdzzD7C3PlpCnti/RRJsochGSaq1r3HELosDdR0//1JV0aAGuUfAtYYmyKySik1aCvTiKz89XVP+9YnKEwo8mx+KVb9Wz1QJLmrIqpLAu09Jq6iJdz2mwsIAONgUlnnuDaodjnEdeffBDVeAkAvMWFOtuP/tIje6Iq/MshN2Hy7u4si0YZT9ABiCz93ZsSel2ljXhkP/UBvTO3vtMuj/NYAUVU0wRpDAO7q9La05Nc9L/XCbF756jOBNLl3vJLaJkn1XTSNcoCBaNoKEuP5EvOJTb/q34bQ8MPEjetqRyqZWS/kAhAlbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [PATCH] description: Avoid splitting the wort virtqueue
Thread-Index: AQHaCnKE6WpcuVXYI0m/DYOBY3uxP7BuzYeA
Date: Tue, 7 Nov 2023 11:55:29 +0000
Message-ID:
 <PH0PR12MB5481C042EC3565B9D5209C72DCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231029141615.1379537-1-parav@nvidia.com>
In-Reply-To: <20231029141615.1379537-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7132:EE_
x-ms-office365-filtering-correlation-id: bd31a7da-84bc-41fa-afa0-08dbdf887081
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OhgqHDBMyojGWQd9/yKcgktQxzlgpXLhNZnGEMealvYVTRHBQiS0o9OxKhrSnXs55ylg45hf9rx5Yuy1ZDfoRQ9nwVLyjK2v3wmZ5ruWVSKd0M7+VmDq+tMhbn+Hm2TdTIzjdxh5Hq1Ell2x5v+g+VSR5XQfUf6b+bISIppwCQQU1sakjY5D+mBz8er7xtOpXxpfoAU3l+DytKSlArgjE8iIxQNnjRdHJR6zYIkzeZ1IxyVlfxApJMRraFsMcb3cfY4dNXXh2l8Gli/VU7SGJYvpfcKnSjrzS7hHoJq3BercvxfFhbCIb3dTJLt3UGnVh8mwEM1pjTe0pYLz9tpH9jtABmxhNPlJyDPfCPKNQjWf9TOfz75jfDNs9uvVQPyznMDc0Dkvbu2bwc14USWGITH9le7/rhlMfaxXJk9w+pMWGEl/M0n1Nq1SGQEDbc+7eYikqeEKeRmeFwvPHKgvzBQpTzcm4lCL1tl3ohFguZxbz+eQ/qhQkMlN02cBBe81z8zpwyysIn6S0jNkCECzZr7iKhxt4LZWKp5qMdjRINZ7Y5NJKL/LfEj3RvKY8XjASmkP8zOeoIjOuDAMnhLlafGePAFxhercuv8EG/dGWT3iT8Hs2GQrPwwoGyAdncso
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(55016003)(2906002)(4326008)(8936002)(8676002)(86362001)(38100700002)(5660300002)(83380400001)(33656002)(41300700001)(9686003)(122000001)(107886003)(52536014)(110136005)(316002)(7696005)(66946007)(66556008)(66476007)(66446008)(76116006)(64756008)(38070700009)(6506007)(53546011)(71200400001)(26005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9TDyd3n/4iwxCvx92KCSwlMC5Xggv/pIeZlT/xcQB1Czg5YDxY2bTL/Zv/YR?=
 =?us-ascii?Q?ysrXYcrRWLeWeFX0LPHKT4ovFtQH4S1lXg1EOZMAQk9PZjwhNGoT4vztXwcc?=
 =?us-ascii?Q?ptquirrt7djzZHpv3UBWC0gytOtizeWA9rigj4UvzWEbz8tWgBILZPZoN887?=
 =?us-ascii?Q?Cv6n/N3fES+S0EvndJab2Syw7boea1x8BpWK4JngaqhN24DE6IA++TRB2ThN?=
 =?us-ascii?Q?Yp1gRKU0s+dyyBaIlnCWLktlU2osaOG3dDwH/GFVQocsZND3FLPOGUd6L5G/?=
 =?us-ascii?Q?ZcR/oH5d8bzqixBDshUczFmtDfgrctYS9Y25eXmNEe5wu08IqjsYIVGVzhbg?=
 =?us-ascii?Q?LrFwEeuvyeBEV8aEzGEYtgyjzKUhaNqiIf8iKtJ8QcEyC9zxVZiwWASxRPyx?=
 =?us-ascii?Q?CzLtTk1Bdv+m9HfB8JfUzFfiJibdMliGzrRmsffw4ZL3Q+4WNtTruRByYAY6?=
 =?us-ascii?Q?ZgPgRFtGBh0QccrqkoI4EFBLEQkv5+AqwKFfuY+7DVgqaKIsi75C2sIapOFW?=
 =?us-ascii?Q?iEd899Xs4X2Ns1Yb93dUSgrJKIDpy/R6/wHVGPtt+JM1O7eraRXft0Of+RKd?=
 =?us-ascii?Q?tksM2g0yJlK28gc0VIwWVGKdxecyyllExrNAgnMAojtEvZoMuSdprUOneDh/?=
 =?us-ascii?Q?JdbW7l6WG75hUda0i+JRIOBmHYET+LOj+fwuiSRI5HNQ6DV5KlUqKuV2+HW7?=
 =?us-ascii?Q?jD0uiVQErKhUym6Ki6sPtkquKMsWWdFggzG7ABpcSoxYCqAab0y8OZlKnhCo?=
 =?us-ascii?Q?ofpFrb+j6hxZluIoKV5zziRWpFVhzZG/VEyy2M3GQe3bTS05pR84y7/Djhg2?=
 =?us-ascii?Q?Y3K/j3G4xwrxIXyVfY3VlOiKGfu6H7CfDpyiQR13uMky67Bqs2/wB3rpKMVw?=
 =?us-ascii?Q?MaxZ0qMRXwu9E9xhv68PSUlVnk1LefJIok5MUrUIBLHFsfJ5pvqAbT2SShan?=
 =?us-ascii?Q?EwpSsDKeujRqkvBph0UlqqIqJazmQNXroGymVWXNRW3BfHV/ecppDSie3m9j?=
 =?us-ascii?Q?n8Y6AjvWtWBJAS0Lf+DnR4Ir18GVexrbIe3tKDhnjU3sfsUxBkGm0POoYDJf?=
 =?us-ascii?Q?x7l3H0C534p1UyR1pOXnQ1DeYnMS2h2UGhtOHcU096lT2uwKm0RltTkmqD0B?=
 =?us-ascii?Q?xrxvDWpxntDc8J/2c8B8FrMaifeMMhsyVHTMAzClM9kwjhk0eKLZhPX6CmHX?=
 =?us-ascii?Q?ewUpi+EdpC9tQC9WgSGJ2eeRqIjqbJzK582dWQ66rmSmN83z7D/7GW+RktWw?=
 =?us-ascii?Q?XlCeyQLyK5sMeKyabQUq+slWcYJbMsM5k5+Kx3G+OtR9GFadJnVYbVKogDgs?=
 =?us-ascii?Q?T2I7c63+3PSRNcJGtVXhdBC9F20GahZ/zWxWs9NiX59us415G0v9pOl+RMli?=
 =?us-ascii?Q?rkc0jtJUSL7jMeyKKw24sgszzgXotzxrkefDnr/Qi2g2COjCke9znY5RH/cY?=
 =?us-ascii?Q?SUDAGHAoS+gNqA10ANQ9GtCZDM1isIGD4o48PbJgdqmO+cocy/aYKms6HtHP?=
 =?us-ascii?Q?Av9cy6Y4QhjIbtWB6zg0Rvo0vEsIfzz+dPZDBPdEseFDy/57q5bDa0LzFMQd?=
 =?us-ascii?Q?7N4jOBaFHESx7MNlZGw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd31a7da-84bc-41fa-afa0-08dbdf887081
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 11:55:29.8914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMQSxun8Rhvl2xL8OQCbzbrTybe5tDX4MQY0Ef2jnnIVksI+Jl1i2W+kZ62Cj54MkDkGfmC2uJW5HtFWsF5kmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132
Subject: [virtio-comment] RE: [PATCH] description: Avoid splitting the wort virtqueue

Hi Cornelia,


> From: Parav Pandit <parav@nvidia.com>
> Sent: Sunday, October 29, 2023 7:46 PM
> Subject: [PATCH] description: Avoid splitting the wort virtqueue
>=20
> Don't split the word virtqueue.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/gpu/description.tex | 2 +-
>  packed-ring.tex                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/descript=
ion.tex
> index 4435248..66e4873 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -190,7 +190,7 @@ \subsubsection{Device Operation: Configure mouse
> cursor}
>=20
>  \subsubsection{Device Operation: Request header}\label{sec:Device Types =
/
> GPU Device / Device Operation / Device Operation: Request header}
>=20
> -All requests and responses on the virt queues have a fixed header
> +All requests and responses on the virtqueues have a fixed header
>  using the following layout structure and definitions:
>=20
>  \begin{lstlisting}
> diff --git a/packed-ring.tex b/packed-ring.tex index 2bb66de..3ee55a1 100=
644
> --- a/packed-ring.tex
> +++ b/packed-ring.tex
> @@ -194,7 +194,7 @@ \subsection{Scatter-Gather Support}
>=20
>  The device limits the number of descriptors in a list through a  transpo=
rt-
> specific and/or device-specific value. If not limited, -the maximum numbe=
r of
> descriptors in a list is the virt queue
> +the maximum number of descriptors in a list is the virtqueue
>  size.
>=20
>  \subsection{Next Flag: Descriptor Chaining}
> --
> 2.34.1

Can you please merge this editorial change?
=09

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

