Return-Path: <virtio-comment-return-7787-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D136CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:26:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7B6587750F
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:26:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 60F4B986893
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:26:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4A73198688B; Wed, 18 Oct 2023 06:26:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3AC3A98688C
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU2/lt9lXRNXsrUIpc7ZCC2PmV7gJlqHivv4uTwTBr7UgMmCqST3n40q1EH52jQlV16QPddxx3TV5xmMNujGK+OEmmHg4VUH6kRmrUTA0Pd/M5te9kWKQa1K9vwZNc2wG2jNm3aqeoiVi30ztVUYSsjcGeM0Mn/IHPepgOJsydesmC5Wk0mJOe5uqSIcF3ozCDgGCukORE7AstFq4AVPJagbMv8VA4Je865mfgsbfR0iMBBPtJu1wZ4WhPB3T6jZYk3jL0rIx6Tv9/NS0rLh/oargKntbjoThmXy3wEc5K3gvDwkRhgp0RY1y9n1LNOJrLLfXPvxO7ScEQvRrxjS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5ARx5Nk1pp1vO+roD/SW2EAxXo8uVDpUGKYlQH2Flg=;
 b=ZsqFJ18x9Bbl7Mbn6gQQfStJ49U8WU/xaFNCX1MPYPsoqKz+M3adsOZWi9wj31QWEtcKa6DYigFGYp9QeOWH6iCNR7b9XBwBklyxQHdVrMW578l9v6WXZdlnsV7gVbmxRF5zJvT8QpLJrG/E+xvp85oz9WrgRbfNfQtIev4plPZHWuK1T0OMzbmj/WcBQJIpJ3/WstmD2Nrx5DssqEO7EtvvTA9bZo3DNYFaSg1PDNOZ4mHVtc3quoj6/VLbvLQtSbQEmQtue+rrhvQeE4/w4SnGRBpfm6wqlt8YiVuCVAWU4THFPQfCK6n2rpp9D06Tm5Eq2TKIhsUbp1Biqeh5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAAiSwCAAAKQEA==
Date: Wed, 18 Oct 2023 06:26:17 +0000
Message-ID:
 <PH0PR12MB5481BB9C112447DFA68E6F3EDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018021423-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018021423-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB9026:EE_
x-ms-office365-filtering-correlation-id: 03abd9ff-b673-4333-4adb-08dbcfa322b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jrWmHgLsk9KmjQPnwRfmLxToVf03R+FjxvmhjpIeZJwFRupv+wEjmy+4R636q1TUWUlv+qBOLt1MLyqP7QoqWi5qnbgauZ20fIPB59SFCvRy51Sp9gqjTlkr6WIs0s/SX6X8rkzt0lGOQLXj3SI8VA2nUSxb6szzTw2FTE2/qqTbnLvVijgHsZIFoQEBWe6ctD+16J9Z9P0UZDUmLtmzEk1BkguQX45xsOob3dtiiBG4U/TOCZoTGyFbUYunmLvk19bG3xpcwwKour3KkO3uxQ1BWPQCtNp089A59KKY0tsBSnND6uX5B/W3iVVB3vgVoKnwC5FdSQj0v44Z+7MsnAHSyAevHeupFT7UzO+VcH6wGPFDhNjYlFZHSne6zTYLZKGAFCzdbhIt94N2PSok9evUbwOM6QPXv72QP8WMiDCn2pksWL+mMDxWAlsTxFp2IvhyhiTBTPhfwu92jbCA4WRY4fMETNaxkEOYfCooZdNXLQuF9dCteXJ07MAS4qepw7Efzt6LGwca7KBzgKsJnsIioxjHTwQXXg0fec8Szsm6oZXfi71D8RfWrhO2oIndvKCc/HJVDrBsbgoott/fSCCy/N3pKRNjCTwalqJZtlzs9UdlHn7VXGXa2FbzRO8J
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(4744005)(2906002)(52536014)(5660300002)(4326008)(8676002)(8936002)(7696005)(41300700001)(26005)(66476007)(64756008)(66446008)(54906003)(76116006)(66946007)(66556008)(6916009)(316002)(55016003)(478600001)(9686003)(71200400001)(38100700002)(107886003)(83380400001)(38070700005)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GZcW3HjyR3ykgBllo+tabi2Bo9xeAX2pLWNuzBMYxsTH0yFQSSj+3WIYnaHG?=
 =?us-ascii?Q?zVyLqDdWtgKrq47aNRWemWDALAG7dQ1ikp6heyXKurF55VGvuTC8USUGgmRG?=
 =?us-ascii?Q?ntYb1qGgz5AIsRpMC7fGK5GOPUP9m1KNWwDBb0vRWkPaHAWUOIAcvGPvtoL5?=
 =?us-ascii?Q?Pd76YIGS/vgt+qbuz4SWrosxpuIp5C8lbdrdH7nXfmaX3iOsvHR2KOt9UV1X?=
 =?us-ascii?Q?Qc3sihGrfY8ThdShR70d/tgDVUsjMocrBbuAo0TnggRZuEYUJlg1HYkkCd9Z?=
 =?us-ascii?Q?znw7hl4h/qOEFWjd3kRse//DWdB8CQtlZRnnQVJQHHrTBKAv2D7XSynAg+a1?=
 =?us-ascii?Q?7/xiIX5QnTe54Jcp08acSuO5A7F8d/bD5/dVZqcQ3u+4eq/n+d6h0BYAq3nP?=
 =?us-ascii?Q?ODSOf700YHVY57pWxX6IoKyeXjjVF5nKzGouI0NFbgRtAH4FZoXvbRwG5Q4e?=
 =?us-ascii?Q?IHiv33DnObeMvOAHAxkdPcL/AdR6dq8sr2lg24gocBqH4UNTSV/dw+muAbeV?=
 =?us-ascii?Q?FVcY0gw64CUcaVereM/9dBKfCCyqD4jNZ4GCoppRjRJYafHnYEmT9T4BVft1?=
 =?us-ascii?Q?vI/TjEfMxljhyRgy3Xce+frpf2bHuJk+Li1/7AI8q22OECSQAbcUa6Vfs5nO?=
 =?us-ascii?Q?rB89pBXvoHtZHS4sxSqoqy4lR/YKqQHbhHrmdVwgEzrYSda6HXoO9utDwOpO?=
 =?us-ascii?Q?mpcBdQv/adpwZhAxCNWLo/IcQRJKgEgrAmkq4aK3m1f1ygiwkkSKym2i4jQo?=
 =?us-ascii?Q?f2E1SVOFDmJjFm2XHbcg74ew2BMnwqIj3mfqtGtrMrC6I6LgeYp1shub1Swv?=
 =?us-ascii?Q?hkgHOZf4TpVwfzCbLhad2Pjp9CCNDWhhsNzfARFALehrA+DZh1XKCWYTFEn8?=
 =?us-ascii?Q?NYjfdKdVEqkO3O2lH79c8J75oLsRjkYomPMzZ6M8J/AEy/7+YgIPBOhG+vNG?=
 =?us-ascii?Q?uysY00DAAUtWFB431xlwUcZTOZpUsOE0qoTO24GiGgWPVbju1YdkCaC+R5/u?=
 =?us-ascii?Q?zajOR8vEehuuFEAdN82i6uXOCJ4V8GobxDmLpup2b3Gi7qBmh9OxiX6hZqzs?=
 =?us-ascii?Q?ligyJlWq98H6qXEOobbFYCWTgYWim4ol/zCWPsJ88wwkydGHVxhkTGos6HVP?=
 =?us-ascii?Q?5zQcCMAJ15+UhThKEDF3WByWpTjTh1opqOffKSWEygg3wbl/FPK2wUPQ9Xv+?=
 =?us-ascii?Q?8wiQv7KXpafOVIkgmjBdUdom9MENMD/baqJ2D6AhaqyxiJxLZAIJdAQVOyEf?=
 =?us-ascii?Q?WodrKkwjPUCtWlrxsKSneYSmHzwjO5YzbhJ3JzH67KPGa2b3l5RzT6tZuyUL?=
 =?us-ascii?Q?hiPz1fLwj17wOTlY9xD3tgYGy2DBu8mMv1/s9475jrAv1QINCf9w+EI9urd5?=
 =?us-ascii?Q?vF7Wp/sCnM9b9toD0E47fihbpGpDleemKB+1AtiesKlaQOCwRpwMsVI9KbNb?=
 =?us-ascii?Q?alYGTbuSZ1P5l4SY4lKo02XG63JOdlU1N5Bmo2WWTaR4Be0ZkJ3o+XZU1la6?=
 =?us-ascii?Q?8ycQyFiBvTwtc1v+owXwBvE2BTlVSsn0xBdvPwH0HNP9lMzI4mQeJzugJOmt?=
 =?us-ascii?Q?sGhPzSjrCA67R9A7Qd0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03abd9ff-b673-4333-4adb-08dbcfa322b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 06:26:17.1718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNtn5Rc3cg5A3CmVUOSLqVKDalEiqNmua0FX3i7vmTcJeePhG8eGu5BE/mrVkuwiIasnoI88jDKedvicx6CAHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 18, 2023 11:45 AM
>=20
> On Wed, Oct 18, 2023 at 04:30:39AM +0000, Parav Pandit wrote:
> > You should have objected the IMS patches in Linux kernel, you should al=
so
> object new MSI-X proposal and say just use registers.
>=20
> What does "new MSI-X proposal" refer to?
Hard to discuss in this forum due to non-disclosure agreement in other cons=
ortium.
But we can expect something like IMS which is under Linux kernel GPL which =
promotes staying away from having on_chip registers of MSI-X.

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

