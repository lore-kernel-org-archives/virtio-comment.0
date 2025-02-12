Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47D1F9F51
	for <virtio-comment@lists.linux.dev>; Wed, 12 Feb 2025 05:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739339665; cv=fail; b=FXbYIjijdLexnJQ+M62eiPjcGZnKQlQrKmsWdqQ8XqJ+Fnq8992tDShgC9i03zYRFB4I7qjll7DWVcz0a3rfx/lT5dhJkk97w1ply3X7rReOTwOCLkmq4LBtam6Mrmqf45LP7qb+L9U/RUpR+NdnXjVR7RlwvYXTjs4F+feqeVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739339665; c=relaxed/simple;
	bh=UVNmQuTjzBdTmgQpTO9m/dsTmJOHAlYqBlFMbAIwFUY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3BEm35D1Yx9egw2zM/UtM0hts8AcVesZN721wSSW0A++4XM94qJddxN0UFrpXO+7tdAZKgyTXZZXP1dvARLApNQWM0SGTo/W0RjLyD3v5Bggpqgb0yhy7KPlgLmapp8xQVeariclV6/C7v9xnP8zBx2BKTaxKxaYdXg9gvgDL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RGFnP6n2; arc=fail smtp.client-ip=40.107.101.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RGFnP6n2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMpF1r8ljCeY0BphB9GflxnniY9b84yM2QGV/PISe7/vshcmwrsMBDX3R79dlcp1IGnhNAZkl+cdHVD2zQP0+WZ8C/C8pHwlQHwV8xr/ts8Tx/du5Q18LobMbjnDM+NxkVMajY/w4l2YRp5qrdXTIaMn+wHHVcCnpqzZVxUo26nGHH5TPs0HYBmz8qaS3BRmXmt2hX1v0GEpGJ0xdJ7l4ShxYJ6mfIAIlp24GtcmzEeZJfU74aXe5qvKRSkrboN5nvmNq8HLcyk1l8vCTTi5PO1wRLejEQvAA0rFU2mPZM0ch3euivGR+/LM1SHIu+ZhrVue4DEtIuHeUY18jRXK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9w89EbXmt1sA8TuW7NVNk3oDB8YQoMbB9eZc/4sKlc=;
 b=Jezq6318nGLM0xn4WGjOdzH1+DZ7dX0VdygmwgpvSUAFDbzVXdBYDU6aRJAHq8gWWO+1Gx43o+aSCqUdqoQK620paBjufuhqRwOVIxKxzv1TAaUIULy01JELekHpDySWLL66GjOs/UnZa5ZlKtcMjzKrqcNcDKCJWDd0/GFoAJ6FQWQNoTGDYdsesZCI8xh+QLiVsZ1yIUkYipUTKYGjHAaPzJ+3GBo/FwZlze5ZAM6B4mST6k3vgxMwe2oldXWHJN3Yt0LMcQUlobaofbC7DWeZRlK35eiF5hk3mGaXGdcBTESlI1fp5f1mMKisLN6dcneYa7VECQViuAySd9jYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9w89EbXmt1sA8TuW7NVNk3oDB8YQoMbB9eZc/4sKlc=;
 b=RGFnP6n2y/b4YLKd35GqzZkg4soGkYnZqUt3JPpM+il5lP3Ce8IHERvhcBzuZ9T/wDCI9yNYu9tESXYO4+NxC4i1N07cSUZeKaIeY9BLYFnR8NQSkh5XjUMCGQDdldVYwarUnm/ArjPI1CDiXH6H/uFBZu9LG4U2WkLyajx+Iopx1kpSzgorpqsbWZQcNB1ArjnFWZ2FzvXlb299yOoy474wvPBeVb6LYkZkiuilR7m07lXi+9OXHWzBf8euIz95N6i/CpMO4iUQs0mZFUbnDa0g8MfoV41CeThfk5uWP1RTMx0YKx0vAvBDyRQ8/AusOQG5g00fSmEgBCKGZeCBtw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 05:54:19 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 05:54:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: Kommula Shiva Shankar <kshankar@marvell.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, "jerinj@marvell.com"
	<jerinj@marvell.com>, "rbhansali@marvell.com" <rbhansali@marvell.com>
Subject: RE: [PATCH v2] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH v2] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbcZAF7fD0LfmEnEOlKYzPKM3C2rNDPXLQ
Date: Wed, 12 Feb 2025 05:54:18 +0000
Message-ID:
 <CY8PR12MB7195AF957BAC92E8F2356EC7DCFC2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250128142152.3662988-1-kshankar@marvell.com>
In-Reply-To: <20250128142152.3662988-1-kshankar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7715:EE_
x-ms-office365-filtering-correlation-id: 089dfbb0-f1b7-4e37-130b-08dd4b29b0c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?N7DOR1TuR8zAEyhU6rv5IFqCqZzzMunUNFAqw9i1PAD09Ilak3D6fOsic+ni?=
 =?us-ascii?Q?fiGER9aQhswsSEeAXbPPhzhF3aS6z87ycJr8voe6CFPlaC56AFkg6NtP9Mri?=
 =?us-ascii?Q?/A7/ynuV85DHW27x6kE/RejDxQhbR757+LeeGgEI318NmT0LxtAaeHE/0okS?=
 =?us-ascii?Q?Wy0IYBb+W2xWkLTVUnT7sHWvKNlr63LjWJRCX5XYhhrD9byhxM8F0W0Jp0fi?=
 =?us-ascii?Q?OXdhBsa1BiGrTMxChL269bTDEjYfySbGcpeXYCX4emRXGeRkYlRs3yfRdrAw?=
 =?us-ascii?Q?BzFSq7A10dcC8fWEWbhnIahJf5LAQHKfXLeHdXPJAtLJ4SeEexqC0FnBbu7V?=
 =?us-ascii?Q?FTGHlVVd/jCfk8sGq0MYZbHDSEvePAoj/T9J2hFPXagIhyb4q2KbIQV53bjK?=
 =?us-ascii?Q?QyEdWEkx0d6ujIVo/XGtS6O2AmE5pi8Xzj1jCmiQKAXfFUs7/1kaUwPMbZMN?=
 =?us-ascii?Q?Pgohyzd2kA4ZaBGaNs/EjOTW85UyYcXYPOKzVN7MvHbH79ewtApP1xE51Jt4?=
 =?us-ascii?Q?nDkNhyyLANocZfpnlrdP36hsyIJWvg+h9OXmYx9TnRyosCQvtaIHOL6GGBfc?=
 =?us-ascii?Q?UUCCZknnDK3LCfOrr9l6XvPnJcREKml6WY3EGIYA0AFaS2XhW+CppdPhvqmA?=
 =?us-ascii?Q?TkrxkAtTxZM9eUmpcUy5fnymPfL1dE3uteo8gpEvkeARI7aG3GkxMOA58xIc?=
 =?us-ascii?Q?lDpZxs+W24cxqmq9MggU1pwUd6vxsBH6AOd6TScm3gGht8uzrVz+5a7bwRAq?=
 =?us-ascii?Q?Qh/LB85xNbxIjtyfJyL0rFXMT/3Y0Pz2jjL5rwYsIdvErWGE8CWyxAA4ASlW?=
 =?us-ascii?Q?BXlPTsZ7tyivaMcofiM3sKz/TQ2Nl0sWG2Tnp9HHGkkGdn2SztWCr7Tu28bH?=
 =?us-ascii?Q?Cu5l+WApY772amumH+2f1aiFCqCgvB+2ooy00jkEPa1d+UtAU2wBwf9c5f4I?=
 =?us-ascii?Q?IkYdwrBM/BoYdnlrswcO5XIhO3O2pON7BJfT+YgDPNsp7g2caGpVdcFWSQeG?=
 =?us-ascii?Q?OcUTRQiMS7+9msnTOHBoaObxvx6Zpu3lGk8vXaD7RMLHJ47yWYRcLF2LYBxi?=
 =?us-ascii?Q?Gy2TLjQC6BGcjIk8N9Ofi49fxHy8yHOoObX7mg0aCiM0QSTW2w2UdaKg//EZ?=
 =?us-ascii?Q?mI1zouX6RKrLquSyi85V/wBWfhHfXSiDSoFzXd+Xs/QPuotCQahTVn6UL29G?=
 =?us-ascii?Q?ugMWlbcJ4BppN2IsM6AOHi2BHI3RINal0lqgfh9NY1vMmUfiX7RkYDdFTwhr?=
 =?us-ascii?Q?I41NzGO5kL5HRNDco89goB6Bj9FN/2FCgWyvfz8vM8Y9aofpIkZPqnCNYLkv?=
 =?us-ascii?Q?FTUs0aq50eFdr5e8yeR/4bu+JgEpZdJ5BLDhnDEbr6C41DjBtcj/bUT69jrP?=
 =?us-ascii?Q?GTV0hJKpVBaxuKLyvHIiRVTyA0L48R1kRQ0Vii8bRxkBoRzQomFo8M78Ky3s?=
 =?us-ascii?Q?4Yl4LIhEi79urG8ex3sGWOb544LA5SlN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zAFn59nuGsrOAQi7g5MFpD6LDf5A1pj/swVw0tjZNtjFRw2sVALrZ92CvN4q?=
 =?us-ascii?Q?1+6fT3elZ0itSwHHyd2lZ/jGaH3htlI5/ShJc6S/4uEqX+cDtcYLrrOM5pXb?=
 =?us-ascii?Q?BGSvecGjHKosAlFp+6E81jaFL3QR/2Yyghji+bjZRJsWuH+f6+edJ9nxJAMp?=
 =?us-ascii?Q?bMCU1nBfXgxpbk2SDoL60ST5IHEnMRHr+EcajNO5eWdsgK5mpuqhIGSjYMFl?=
 =?us-ascii?Q?aCIftaqcTo4FxT/+DgdvWPynOl927E06B+kKtzA7/b0+spP7ybLWct3eKDWg?=
 =?us-ascii?Q?e63fG3UzZlLoHX7KjZI5wbVPCV6LSooD1+kfhZd68lPnYMhbDlStYItY9J4T?=
 =?us-ascii?Q?lEGuR77/DUzgDFQEo1uhm/oOPAqZJ15//plDYg6krxVN15NwHnwuMazkOrlM?=
 =?us-ascii?Q?pJRUNw0m7+OO6+AwdEVNbSxlqdmsRtQvcLYzdWzYkINlCw3J+nA7ZlFqN8eL?=
 =?us-ascii?Q?zEJWiJed0T8roC8pJMXWT1LS1srUXLU76qdp6bpx7LOsiqlF0uEYngn57peb?=
 =?us-ascii?Q?M4bamwZLiuKA8+ko58kZljYWD+12DT7KCukpQwvhUbcHvCVSQtLF2loU1iXT?=
 =?us-ascii?Q?Eybph7TmiQB6axgvdDWFiljcQW2XyryLEVb0RA1FH1frTAeQzazEQUg6qFtG?=
 =?us-ascii?Q?wf9ZHnZSm/5hYNTh70Af+de75QWMXf5TAiA+ANd6JMHjJ5hdaBI5PLSzB2YW?=
 =?us-ascii?Q?LZYMlt9akxmFZ1/BTcCOCS7FA3v8qK8ZPMTjUEXEnS66o+Z6z04+8EghmLLw?=
 =?us-ascii?Q?PeHEHcOBcqrRxhInzpShS1YljEG2wZ6zaZmI0zYqDSbEiubIIJ+8rcms7Zy+?=
 =?us-ascii?Q?u3IqsOJl8yr7N0qStMAKUurqZDEVLZOxcZvjzlLx0Jm6uxSM6vFc669Yckuc?=
 =?us-ascii?Q?FdnR+SVgta4Wr/duE+72eZzqWAcrJOUGts53KhZNM2BWkFjgMmZJ3k0ONhX8?=
 =?us-ascii?Q?B3OA+U+fHHbQXWrJ7uv2XhTfLM0lCosye1FPA8tgXRIxSZb64wU+Wzjh70Rc?=
 =?us-ascii?Q?SMRy+fSEjzgffutTV4zGGxzaveqDLVG+KuNN3nz2RK7yoMsiXdVdh28wnQJS?=
 =?us-ascii?Q?Y0kQCg4FkzLpqSx68SEI3mY8iTKMj4uz3P2+fV070ehFfYWS2mbk5zEfNoco?=
 =?us-ascii?Q?60pxq3ppMp+jQvlyvVLE0GKUz4/CFcJqrivMyeEGsa5kGvt9BqZvxhZxFpyz?=
 =?us-ascii?Q?KagrQTpeeaewtFT5Of23QIiW4bT+29LfbZA8ghxjQO2wCLH5uT+5HzIAmEv4?=
 =?us-ascii?Q?wPYI4/0PXpg1vMD2TIB9K/+C27iz4vuvoVr55Pmc/nsjlgIUT+3u3OTkrAvL?=
 =?us-ascii?Q?Ar5wmriiYo6Uv19toyZCKyGoB9ZHkLc5kSrOUfFx790dVNWasoLCidb4HJDn?=
 =?us-ascii?Q?io+k7PPgxKFRIf0FDoA0qvlgJZmu2H1nq73FHXwdTDEU/dcdM6kc6KPv74xG?=
 =?us-ascii?Q?Jg/lzep/gT3GgjFFkLhdDtinAhjq+UZ5c3OYujfZpnhshyBGA1DY5QOomoju?=
 =?us-ascii?Q?zfXrUFMhovbM2eWmEQqOMYEopNOFnheDG1SpqH/D017XEKlbHzBWS/vd/JXE?=
 =?us-ascii?Q?GxeCsLQaKU0tEKziPQfmXWytvPqOE4C8Zr8OzxEkQgo3TVzMhsZMbqBzm4qJ?=
 =?us-ascii?Q?4ajfuvOr+c/tGzg+rukuP3dbc7g6iai8kLJh/qDszuFQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089dfbb0-f1b7-4e37-130b-08dd4b29b0c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 05:54:18.7939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9F7fyk5IHrWWX4kVHyDsqDPhq0GrWikTzXlp82o5TrIPTa1jf47rhbwdh+fzm9PwmQ9WW0YneHQrtRunYceDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715



> From: Kommula Shiva Shankar <kshankar@marvell.com>
> Sent: Tuesday, January 28, 2025 7:52 PM
>=20
> This patch introduces a new field in the virtio_net_header called
> out_nh_offset, along with a new net device feature,
> VIRTIO_NET_F_OUT_NET_HEADER.
>=20
> Currently, there is no field available to directly read the outer network=
 header
> offset in case of segmentation offload.
I believe checksum offload also need to know the start address of the netwo=
rk header?

Currently, drivers lack a dedicated field to signal the start of the networ=
k header to the device when performing checksum offload or segmentation off=
load.

> This requires reading packet data, which significantly affects performanc=
e in
> datapath.
> Additionally, some hardware implementations requrie knowledege of the
> outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.
>=20
> To address this limitation, we propose splitting the csum_offset field in=
to two
> 8-bit fields named csum_offset and out_nh_offset.
> The csum_offset indicates the offset value from the csum_start and  may n=
ot
> exceed 256B bits(2^8) for protocols that use a 16-bit one's complement
> checksum
>=20
> Following table lists such protocols and their checksum offset fields wit=
hin
> their headers
>=20
> +-----+--------+
> |Proto|csum_off|
> +-----+--------+
> | IPV4| 10B    |
> | ICMP| 2B     |
> | IGMP| 2B     |
> |  TCP| 16B    |
> |  UDP| 6B     |
> +-----+--------+
>=20
> The out_nh_offset represents the start offset of the outer network header
> from the beginning of the packet data
s/start offset/start byte offset

wording packet data is confusing in context of packet header and data.
I think it should be just, say 'from beginning of the packet'.

>=20

[..]

>=20
>  v1 -> v2:
>  - explicitly state that the out_nh_offset can be set only when a valid n=
etwork
> header is present.
>  - updated out_nh_offset usage in the RX direction.
>  - minor word cleanup.
>=20
[..]
>=20
> Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> ---
>  device-types/net/description.tex | 38
> +++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 76585b0..529b7b9 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,10 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
>      channel.
>=20
> +\item[VIRTIO_NET_F_OUT_NET_HEADER(50)] The Driver can provide the
> start of \field{out_nh_offset}
> +    value. The Device gains advantage by not reading packet to calculate=
 outer
> network
> +    header offset.
> +
Please rebase the tree, the next free available bit is 69.

>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash
> for encapsulated packets.
>=20
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> notification coalescing.
> @@ -418,7 +422,13 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 hdr_len;
>          le16 gso_size;
>          le16 csum_start;
> -        le16 csum_offset;
> +        union {
> +                le16 csum_offset;
> +                struct { (Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated=
)
Please put the sentence "Only if VIRTIO as C comment.
/* ... */

> +                        le8 csum_offset;
> +                        le8 out_nh_offset;
> +                };
> +        };
>          le16 num_buffers;
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> @@ -457,6 +467,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \item The dri=
ver
> can send a completely checksummed packet.  In this case,
>    \field{flags} will be zero, and \field{gso_type} will be
> VIRTIO_NET_HDR_GSO_NONE.
>=20
> +\item The driver MAY optionally provide the \field{out_nh_offset} value,
> which is negotiated
Out_nh_offset is not negotiated. "which is negotiated" implies that.

You likely want to say,

When VIRTIO_NET_F_OUT_NET_HEADER is negotiated, the driver MAY optionally p=
rovide ...
A nonzero value of out_nh_offset indicates....

> +   using the VIRTIO_NET_F_OUT_NET_HEADER. If \field{out_nh_offset} is
> nonzero, it indicates
> +   a valid outer network header with in the packet, and specifies the of=
fset in
> bytes from
> +   the beginning of the packet. Otherwise \field{out_nh_offset} MUST be =
set
> to zero.
> +
>  \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
>    checksumming the packet:
>    \begin{itemize}
> @@ -531,6 +546,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \field{flags}=
 to
> zero and SHOULD supply a fully checksummed  packet to the device.
>=20
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, the
> +driver MAY set \field{out_nh_offset} to indicate the start of the outer
> +network header offset, if the packet contains a valid network header.
> +Otherwise, \field{out_nh_offset} MUST be set to zero.
> +
It should be,
Otherwise, \field{out_nh_offset} is not used or not defined.
If you say, as zero, it means that field is valid and full 16-bits of csum_=
offset is not available leading to backward compatibility break.
=20

>  If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
> \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
> segmentation, otherwise the driver MUST NOT set @@ -610,6 +630,11 @@
> \subsubsection{Packet Transmission}\label{sec:Device Types / Network Devi=
ce
> / De  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
> device MUST NOT use the \field{csum_start} and \field{csum_offset}.
>=20
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, and
> +\field{out_nh_offset} is not zero, the device MAY use
> +\field{out_nh_offset} as the outer network header offset. Otherwise,
> +device MUST NOT use the \field{out_nh_offset}.
> +
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
> been negotiated:
>  \begin{itemize}
> @@ -725,6 +750,9 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>    set: if so, device has validated the packet checksum.
>    In case of multiple encapsulated protocols, one level of checksums
>    has been validated.
> +\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> +the packet
> +  contains a valid network header, \field{out_nh_offset} MAY be set to
> +indicate the
> +  outer network header offset in packet.
>  \end{enumerate}
>=20
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN @@ -
> 802,6 +830,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  device MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in  \field{gso_type}.
>=20
> +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
> set
> +the \field{out_nh_offset} to indicate outer network header offset, if
> +packet contains a valid network header. Otherwise, the device MUST set
> \field{out_nh_offset} to zero.
> +
MUST not use..

>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the  device
> MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in  \field{flags}, if so:
> @@ -851,6 +883,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>=20
>  The driver MUST ignore \field{flag} bits that it does not recognize.
>=20
> +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> +\field{out_nh_offset} is nonzero, the driver MAY use
> +\field{out_nh_offset} as outer network header offset. Otherwise, the dri=
ver
> MUST not use the \field{out_nh_offset}.
> +
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set or  if
> VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the  driver MUST NOT
> use the \field{csum_start} and \field{csum_offset}.
> --
> 2.43.0

Please rebase on top of the udp tunnel offload patches.
