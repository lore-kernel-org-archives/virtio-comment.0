Return-Path: <virtio-comment-return-8604-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47DBC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:31:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 47AE32A894
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:31:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E1F99868A8
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:31:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 083659862D9; Fri, 24 Nov 2023 06:31:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E92F59868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW9zj6CoYoh1lPDiQqpQzWdYRxF3+oMyqXZ49zjaABFBLmtua6By0p2hdECzCFT1zssiwTSi0A5PHOwyaoWr28a87N4WPTtjtWepIXS5XgqpEYW7x7y7uGugOcUiKSG3I6kPF1mAXpB+71E8C5BrqqJfbbFVRBHJtGme9CT8h7EEhroZdHe0tKy5E/q+9szuLd6ytq49cjI+w/g7s+ncvEpiej5al7AXOuWXaNqioc7gyELJyRmKaFcQuFOnVMMWTMb1qJifWN09QA/F/c5fspNlg9KO8CXUW/vdlOVFdOWdCYQ/KFLPrnDMzL5fWaQ/5Xpw45v3hFtkwrf/TPO+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+rOstPy/9a8x8IwHzMgItc6BKaHH1RIvYQGGTUe4zY=;
 b=NDPbh8WLMAX/rCsCmRT+xxp3hZd4sUj3q1Ch54viSlNLGAVBjdksgHKx86vd5LbfoH1554vkQTnymvP95GcDodAOp+txOncwFcmKTxvKTg6wP+RAzVzfWwoNR2fUfX8ag7NaxoKIFcbFTIDzsy3ESeVM4nX0PkHv/fqfEzJOYIQYmaxf7EXx27y691/yfBO+mTCH5RZQyMBqCzVs7owCAJCoPs0QkFMhW2wzHqEX8AnZFgAnE0hTOeEn1MyxA/sRf1pvRQQvAgDsTaFKCAbourt95bSw2BA6OXceK+4ndbRd2P2/JajnE8pPFOzBDMOfIgN5SVQ6mA9dBdFO/+voWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAMmwCAAALhQA==
Date: Fri, 24 Nov 2023 06:31:03 +0000
Message-ID:
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124011125-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB9255:EE_
x-ms-office365-filtering-correlation-id: 3dffc4f4-eda0-43dc-3391-08dbecb6ee7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Y3k9ajvbsKO2SfDdDfUV/E0f8Jin2Jq21e806HT07nRtBtK89Ob10WlzxMCAiFwkk5Cz5Hj78ei1s3BKy+5JopISn4CefYC78zvP9wMXkfTkTAuNxCsVLvH14hsMyaiZGyoWdxMq14S7dvcYK11T6ZD2zwvyqMZSMDQFKmsY4SX5peR6mxF+iWAsMZshCTkIwv8gDwsSO4y8pS0rZth7U8DpFVpAAnRUo9j4nxAsQWwTpc44UnXJlXYHgqGQk3EVETqUoCqN36HLCDQih93EXac7OPvV4Npwqj5YAL3DJruAOfGJ7wU46QPZ6lAD85U5t0WKHo5M8WTRz29HSv2qqPfyl1+aVy4eFiRzoXiyRvvb+sRkNUprBxLQW7slJR+NqnVXxWvuwtMXR0TH74v0DFY/02ZYqTyy+guTuuo3JIlt8WoW5v76LqbaL+PSwP4FVCpBSo+0gy5I4UQmBAEvUtD2a3+ZsFcPQhksJYo8ZBXvRXeIXm0rvfPp2mwKF/VYAHZAY053azeoJwS5b3iExmmBlJLkxC6BV73cpEBQjYW120YnRPpyqJTrtzzw5lcV9epmfmGFPKxnq4g8cIqJUF+6aw5M03y4xBtGs8k+4UWK0X3y8ikNzJIxET7l5euv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(9686003)(71200400001)(83380400001)(7696005)(6506007)(8936002)(41300700001)(8676002)(4326008)(52536014)(5660300002)(2906002)(316002)(478600001)(6916009)(66446008)(54906003)(66556008)(66476007)(66946007)(76116006)(64756008)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IoGNf4leV0lcFq5suE+hLa8QR664q6imiiy/MvO7Oogo+yh11Ew/mf49IxBq?=
 =?us-ascii?Q?EAwlBBsqYqJa3f+icyZaopqtRl1GPemCtSG95cMG1taQfg3K6PsZVUyt6Hj4?=
 =?us-ascii?Q?/BQ9tNuuXMo+fYQRbYHcSx+rS0q7vCkT1l/0cWBcxl2Ws0YRX/lSABLpnN5o?=
 =?us-ascii?Q?pEp0sbVa/essJyvAeyQKw3RrBVJLHur/ny8QMtT5NgHE9qFB6c6rtAdR6uEh?=
 =?us-ascii?Q?LsDGkmD/yG+X10yomViuuEvrjeiz2i0fj+AjeDGl1iMc9WQEUZ9mutOlaYl+?=
 =?us-ascii?Q?CJwVaFCUGW1pd+t8MdBb8H2htnzGPR8G+LFE4h0FYmYRraMhq/sSjHctY939?=
 =?us-ascii?Q?ueeWIKYNy1zykyoiV2JBinWGdNexqyz2rOGGotmxlJAk9rkbIxcjen9dtZ6J?=
 =?us-ascii?Q?Fkr4UdxR6Zlsr0Z/WZz6aTRYkNZ29heooYIyCZM5YtU0A5zpP10VuK7zIw4X?=
 =?us-ascii?Q?151XR3b2h33CKJvaCsHwczHtQFwW7ZvM3nPhLl48sJlOul+lGLAXHk+VLMBU?=
 =?us-ascii?Q?XJ4SWUMPEuOk69jCMFOz6eSsOmrFQUWO8L6MWlEPmI+Gl7lvS8eZKAF3JjiV?=
 =?us-ascii?Q?tx66s91pJcZAkGhK/09rVwV/esWCbHsYrsK+GtF7cdyjgQh6h1Ame6UjYsnX?=
 =?us-ascii?Q?ct+gILhRFAS6vB0IjQHphUAu0Jfe2OwjufYxcv+A7kmlqXee4YAY+cpREXfC?=
 =?us-ascii?Q?pM4IQ6tSA/cJ1Mmax8a4yY3UMydXXiH2yV0gGhFydoM2QcEWaGXdzevLFV0m?=
 =?us-ascii?Q?N60nHa6Vn1RpZSuCddUzGQHrVJ4nmiRYlx4MS+EM0LfSRXwUoDr+XoTmfyeD?=
 =?us-ascii?Q?8C3s/mapGOgP0M+GRz+fPNgkAvhMn4fLwOaFYkh9560tRBQfioqHQOzTXhjt?=
 =?us-ascii?Q?pbuDxD/G2zUmWymBVPQI7vriy+0TvWwmCobiEnxY0tQxlm2PZJsogXJotkJ1?=
 =?us-ascii?Q?WiVD8fpOTmfB4R8QPFYJBYacte7Chle4Az0H/uQ3iAbW3LdOTXlg7qA4z+Fx?=
 =?us-ascii?Q?BgYT3veRn27fxZ1dmDBMOA3QwTLaPvGDdWiySm3mB1tZehXbcJ619GjjEaiT?=
 =?us-ascii?Q?48eyGcz4MC/QMISn4L3l9Al3sNsUFKXKNttAWmANCuy/LAT6pPx8n7j7MiVf?=
 =?us-ascii?Q?xbfphRxgWHmI+WJQrlgpy9UO0tJgcSmwwHbKcwblIREMN+Nkt5RLp++xZJei?=
 =?us-ascii?Q?r1J8PtL/XmwxWIe/k08ZMbW05AMSwJDDJ/37hF27y006B7DnY5LOFB7+wJ9r?=
 =?us-ascii?Q?OB0m+P0EhbQYoBiNIjJP1ZaSBEvgbIL6Tc/JVlVL7jHIR3VTY+ZIxcPB7O1k?=
 =?us-ascii?Q?QB9/y1I0FumZ2e7tLfBI0ns+M1EXRmPS2whjl7H8NX+o3YgoS/cpCAHaptSH?=
 =?us-ascii?Q?8Nva5BPKCHnjjB5n4Ul4ozzwAUtSBCyOobKPuWPuJwkl3vklxlRsUvWxRCjX?=
 =?us-ascii?Q?qIcxi46ATJ9zgLjj9+1sYfEz638a8gxfZDbmCF57bdFUCWuz+KjxyFENrRzT?=
 =?us-ascii?Q?N1+UNualegWvObEezLV2L9VHIyAzqlL5hZRB3UtSIHpT7l4WNQfqBAqYbNVp?=
 =?us-ascii?Q?21TV87Jy68gRsevyfEk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dffc4f4-eda0-43dc-3391-08dbecb6ee7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 06:31:03.1757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PogbigKyLnmtSFjPNd2GsXt+O9rEAzh16wJqbFpgrDc7w3df1in4g5O8JwQE7cLjALU6ZIad5MQiJiUIW+cyzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 11:48 AM
>=20
> On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > we
> > > strongly suggest that *drivers* support both old and new mechanism,
> > > and then *devices* will only implement what's required.
> > There are other examples in the same document that makes things worst
> with old and new.
> >
> > Also there is literally no way to enforce that driver supports both
> > and new. It is just sounds like an excuse to force infinite config
> > space.
>=20
> There is a very simple method though.  We allow devices to expose a subse=
t of
> features when DMA is not used. So drivers that want maximum features will
> always opt for DMA. We can also strongly recommend that all drivers suppo=
rt
> DMA if available.
Yeah, don't see how this is elegant at all with all mixed bits.
Nor do I see any enforcement, single method via cvq still holds strong.

>=20
>=20
>=20
> > The method proposed here is elegant and clearly promote one way to do
> things for driver and device with predictability.
> >
>=20
> I don't see it as elegant at all. What is elegant is *a single tag* that =
describes
> each property of the device. And this single tag should be good for every=
thing:
> driver, provisioning, migration. And config space offset serves as such.
The single tag is the set of structures.
Provisioning access them via owner device.
Member driver access them via CVQ or 1.2 legacy config space.


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

