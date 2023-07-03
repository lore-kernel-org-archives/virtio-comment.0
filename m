Return-Path: <virtio-comment-return-6694-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C40C001B3
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 20:39:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3A23060089
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 20:39:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E95898658F
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 20:39:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 093D29842E8; Mon,  3 Jul 2023 20:39:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E806F986559
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 20:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeaJBD+WMUkZmfb6B8MUQSDUW9/l5oY9Zes6pBKV/sMcj1LMDt5G6/NKwuyahqEAJJcXuDB1OkrMuJFML/iJV3GO5u8JE0G7921j2/IDvyULkUVZKlE2N2elBCSmZgsHbhxbqeoOX2PknPjH0ufNPAe0yOTzbPqtCva029Y369XLkPDXR8iW0Avjn0phKgM+4GjXZy/YsiRJkq17REelD/Hn/XeKAW0GwIEl+NVECFp8rMJyXs3YfsC0VhsIcy2eDjVA2JaeGxHpPbTqL6CzMKlduOQXJqz5XRevBjOXCvO5wsGgBpmtjYsQ5jNiiCPt+TWjozap2+0w3Y+jLWpNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jdo2jqLy7oX6urit6vqEn3b01xIWOuj5ZLwKikovxj4=;
 b=OC+RGh4E5C6jbyL/qYlXoyWP0W4Faa7ZNiNo//XW1UZAjsQjLWFbcefq9OKxc+jnlRCnQOuXA9CjA7oQPuXbg1O+JZbtHnv5WCinJqaONPIr3Fle2LL/vQW6cwt+EiHP0poWTSySlVFsl043+ub5T6MnCQJraeT3XQl9x/VJja9MXdNkdd4318Ddw7kKcODz1voJ0Z8/Dz3ViH9sSzBuKUZUwk05wLF+tcf6C8DvXdCoNRT0JxeaobotLHoiGInLrfPmvRqSus7vhan/qnkLWwj9jgwRvdKooAKNOztmXasPtFqXPU1ncExHOHJZNXPFVPu2K3YvbUR4xn+6FmMu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] About the plan of Admin Queue
Thread-Index:
 AQHZo0OgMaVHGskGLUio/ZFR6jh2f6+TVwYAgA+RFwCABNz3AIAAAtoAgABPh4CAAHb20A==
Date: Mon, 3 Jul 2023 20:38:57 +0000
Message-ID:
 <PH0PR12MB548146B440C789EC38DAC507DC29A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230703071106-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6361:EE_
x-ms-office365-filtering-correlation-id: d494c878-884a-40db-3d65-08db7c058643
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ygRgsRMFswXGCDatuDzHUdrGzDZSqvHDT+iq9AzMVMristm5iWTHD/Paj3Bh3sqrmYzvEgqeqMOoL7xHMEA9GttGOHILE4umzkFAr7EXX2fjFZ1sXFNF5MfUy+gGROA7OBI7eYBGOtlinyX5aeH2YkZy0EKUYGW00z7dAQnOI2324m3z5JnT0ECalViUGk955N8/wQRHUeaUumRCBT9SX10MGvWiutVFGnFBhCYj2sixFexBKqTocSlVlk++OQ85tjDw9wyAItdtR7THFoGe9631Ld948kLSSui6TJiJZIFyObMAlG5ViJfE1IXNU6cUo/VI66YyoZMrx6tPBqSBCB8gV59GsdL5inuvxNoT4DloKLTh4sGHc2wDMHPEHgiLtoMb/kZM/k8K6NGbMf3RgRVElgu+C9pvi3uvVEkqwGUdPXR1hErzoOJIDt6mmxVxK8qvMl5I6f6s47XkXnyDkuHsrQJMJ7LCILe5bo2j8G06gsJmQ4KZPcDHM78B/i6fkJyqCT0iBbEG2oCv04XICFFREw9uu/p2UlTTGg34Rf2MHKJVNPygPFk0xAgj8jiJ1tn7ax9MEh1SNwXIeebPb7NJqtA48P+AiFYTivtLTvqpqOWe+6pjDySt+Cggsyw3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(38070700005)(4744005)(2906002)(41300700001)(52536014)(5660300002)(8676002)(8936002)(33656002)(55016003)(86362001)(186003)(478600001)(71200400001)(26005)(6506007)(9686003)(7696005)(122000001)(76116006)(316002)(4326008)(64756008)(66476007)(66556008)(66446008)(66946007)(54906003)(38100700002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BsLI4pVC4kOPScYgLvWCGsgn0zzDpBxhIFxBgjnPykRrzffnX5+ipgW7oj9g?=
 =?us-ascii?Q?xcftTh2jyjKDLqXMdSxZ9jSu7FHVKGlpuqxhcfBjF9c9jatVMwiLtA4fOLb2?=
 =?us-ascii?Q?W75qQXpwxPAEqkkt/0uvg/lHdwy3i6PJuUy1RyZ6FzzYuNlhzNEIXWKc5BCt?=
 =?us-ascii?Q?x219FSRfpDbKYdykTtggCk63PReg/Q6L1/SNaXQyHW78PR95usNsN2we0Gyr?=
 =?us-ascii?Q?U31OzUoZfyxijjQoRqk9zv/n7br7Ju2s09q5+sKXH87J7B1qUcLhrAOCJ/fq?=
 =?us-ascii?Q?Eui98jxqs7q2ZPnrQe3tblbFJmdW3qtqy4Z2hfchs8NH3R4DfzJKt1KSgN/c?=
 =?us-ascii?Q?fCUSgarckXnfseWJJqwAa6+N276fiITsFHaNrmSGlp5QhVqGmJKkVIvj0ynz?=
 =?us-ascii?Q?WGmEJnwmh8eHI2rZFKmlxczTYtvY+Hal9kauosEhdbdT31zMQSppBxxXafYF?=
 =?us-ascii?Q?848z+91bjttGGYXiSRaUzWVVVGDrRiwh26R5ste9SitN6dtJGKzdPmPFGU43?=
 =?us-ascii?Q?1uwjWEmU+C9bbfrhoNWotvwo8BpsjJuow5p1C31F3k9/YzsNwHxElDGi9XkA?=
 =?us-ascii?Q?Uo4W8rDYjhSsZSDnwmhuOgwydcHnilrqot6S6/Zmi46svtzrLDCZzVdhN0el?=
 =?us-ascii?Q?UxcWkTkl/3gKwjAGR0d/WpbLqcu14fM+kY+DeFhsnQW4XOQhrQh4ZwtXITrz?=
 =?us-ascii?Q?aOFTchEDK8Um3Ia3B+S+vFjk+x29Oq+XT5r+sRSLwbg5zRqZfMYQIE1bTD1b?=
 =?us-ascii?Q?d6Z2AFYpXD+qZQ2Sx3gwpmedDntuRuDv/lHmdUOK2VryGXXS0icgTK3PJHbg?=
 =?us-ascii?Q?8FAPYjE0Pp/pNC7GidQ/TqRfNDQ+GbVAIz3HEd3Wxzq/oGdZ9HZOSx46WRYZ?=
 =?us-ascii?Q?AVTbqJXCTMfe3Il54yG3phi0kJ0+B0uAsP1pX1ZTru/CJPsYpByy7WGPiA6O?=
 =?us-ascii?Q?AFGSjf3TcgDlY5Dwsyohe+LxkGrrVwqBIoFXCNNFJYUlYEyXc+iXnW2dcpO0?=
 =?us-ascii?Q?OffIAXuUsKB/bvcmgAffjeXHhTIqEPlsv0u8lUQD1VjNd8cCRT9rnNRzWETL?=
 =?us-ascii?Q?gzhBLOLk+e3NN4LZyXD468wC2k54cSyveYDaVAPkONw1ptzbV9CezmTa+9xM?=
 =?us-ascii?Q?G/epLE32hasUsjXqzDS+sDG7Wj22WHJCJ2qrg8f26/7iwMILg1U3KNx8lHeq?=
 =?us-ascii?Q?9qGamTJpXxVv0WSs2JefBKQSQ8lSGLsRhjj2UGWfsqgm8nuCoMfBsuKDSlmP?=
 =?us-ascii?Q?7apxtUaMQLh42w5VlrhR7CvOxEXyvlenHk/mNcBl5UaDWlT/pZEn2Q6t3fQb?=
 =?us-ascii?Q?PBNCDPN48CP7BmJmfF4o05iyQp4WIOO6tKgrDrqi4Wo3Djtf7mk9MQcvy2H5?=
 =?us-ascii?Q?viUtdOHmpa7V5KO1kuXcJR3QdESuqDfSTCo0xJjvmz6HlxPW24q+0rUnWYuR?=
 =?us-ascii?Q?o+qIvHyNBPAECnh/N0qR51rvW6VmG4NH1o5HAx9rJuIx1mxfMJrm1tSXbfaY?=
 =?us-ascii?Q?Dh+YuweYXXbPVwsSVQytp7SgcvekMc0qm3ncY8j4myj3PIBfGt4upL9/x37L?=
 =?us-ascii?Q?RtBuNhGQ4aSsmbz+Ook=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d494c878-884a-40db-3d65-08db7c058643
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2023 20:38:57.1703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJ1gmrIuxLXM+kD80N24jz8eseijvGLgdQyaYX+XiASBGA2j93fbrh2eI35wneaX3MLjL4N+xkpe7SLs6u2XBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361
Subject: RE: [virtio-comment] About the plan of Admin Queue



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, July 3, 2023 9:05 AM
>=20
> OK it looks like at least Parav and Jason understand what's going on, may=
be one
> of you can explain:
>=20
> 1- there's a management stack that can bind an ID
>   to a group of properties
> 2- the proposed command then binds an ID to a VF
> 3- after this, VF can be assigned to a VM
>=20
> Is this a fair summary?
>=20
> In that case what is gained compared to
> configuring properties on the VF directly?
> Why is not the ID an internal property of the management?

For VFs I also believe we can live with an internal property.

For migratable SIOV devices which are spawned by the management system has =
similar ID assigned by the mgmt. system.
Having such node local ID is needed anyway.

There is a struggle (scale wise) to make such ID network wide unique if eac=
h virtio device to expose such id at transport level.

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

