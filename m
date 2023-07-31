Return-Path: <virtio-comment-return-6919-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC863C001DC
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:02:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 282573E302
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:02:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 10A58986382
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:02:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F08D9983EB2; Mon, 31 Jul 2023 02:02:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD3A8986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 02:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxB3fVqO33AN9Sn//c9ESpYX2NrkDHWxbS8+PNM9+HaXWPqzYAkc5FousW0ztHI+KmbubADwfY+93OdT8O6DGnH5r49NqV3HgrLuBf9wnIjC0KqjaykYFPde5lExwb278b/iErRHoHi8YcvtbBgKhVaXFPZeoRAp7le0/fswJDz5cyMiKVWRt3VtNSie6X5bjxypr/8yUggUyDVyfsmJp5Mqrwbt/vYuRaXwxQsxh8WE1QsQEhuYryPjrd39hZiHn/8ohBfSvfFvAzP5019Xtnt9EGr6/KY0RiTexuFpF7mX/KCJa1tGbTF5iLJ5tGXpJFrNrQUlJJblNiUUBRtazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi3yX+/tjTgk8Mn6ciuGjkxBIPvVWURVdjQ7sYZv4zk=;
 b=dPrawZH0L6oiYiijtHt6j+3EVO68qewf4lfJCwYTacgSc+z+IpOP8en9nncVk4U6uDNIeqnIVklYt7OCZ1vH31bru8eyqJnT5DWOLOgryAETOOt6okf+pfM0aPLGAZKrT9zGV8ywRZk+zCVGSTRUPKUzxLwcywS5ZFicZFwvhHhh/AZP78Iyh6UUm/hR7EIxXpiODmNNhJAKTiE0aipHT4V4vdmVVn1I2OEteyfR+MMH1H+rB1g+GsH4WUIqR3CD1K5KKIQgiHfase/TPB920m09I02dJbefxa3Mpib7VFowCavBPL9UMYFQiqpFIxNFVkgGnmV2BbH7Wb1xqXuttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Washizu Yui <yui.washidu@gmail.com>
Thread-Topic: [virtio-comment] About the plan of Admin Queue
Thread-Index:
 AQHZo0OgMaVHGskGLUio/ZFR6jh2f6+TVwYAgA+RFwCAAAcYgIAAGFcAgAACKwCAAAB8AIAACicAgAALnICAABYRAIAAC8gAgARFlgCAJZahgIAAGBsAgAAlAwCAAAJ7gIAAAKCAgAAdAQCAAXJ/gIAEZfkAgAALboA=
Date: Mon, 31 Jul 2023 02:02:14 +0000
Message-ID:
 <PH0PR12MB548142BFCFBD93FCCB64C443DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <b95673d9-21e5-0fea-abdf-c0f8389e5cee@intel.com>
 <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
 <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com>
 <1688111784.0426908-3-xuanzhuo@linux.alibaba.com>
 <7ab5978d-c503-c279-a42e-bcdbf40184d4@intel.com>
 <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
 <259c7b04-58df-8085-755f-a36993556a89@intel.com>
 <PH0PR12MB5481243B22A694E42C351C20DC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e176f24-293b-5be0-2928-e8ce0300e75a@intel.com>
 <1690425015.0990853-1-xuanzhuo@linux.alibaba.com>
 <52fa9d57-c21a-0235-b8bb-614e88e25f17@intel.com>
 <1690438140.7109714-2-xuanzhuo@linux.alibaba.com>
 <3f3b3a17-8199-8830-af22-94686feac956@intel.com>
 <1690438807.4627175-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEs=zL-R8-0yvKz3ZgZ8MWiX_ErTQYCAu8G49D75GKhpAw@mail.gmail.com>
 <1690524599.5130646-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEsw1HWHsza1hOEGjAk7FiwQDG6HD5QfVsk+eQXJ1TMuTQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEsw1HWHsza1hOEGjAk7FiwQDG6HD5QfVsk+eQXJ1TMuTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7249:EE_
x-ms-office365-filtering-correlation-id: f758cf19-8306-4586-da73-08db916a28f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hI0MN1ksGAqZRyn1Gphlw8yRwU5aBiXeB8ZjqpKybjDI5RXqoBePo2hg4Ecb+HQIx3oAYlIn09/uEs3qDbnoPW+19ngV5E+7G02g3CkahHth6rgcHb6mTxAAd+uSutp3wnCr3Gx/5x2Eyf86yX1Qmk2vAl/T89LJFAKvYv+mek76Cl20OOPECKDPGmj0qWzyPNC0NApYiznJYiS81cV6kmT+3bbE0oRGPQiXZN7L60Gvs+48A1LqD3sIzqGKkgvuL1IEV0stZKe+jMNf5mToqam1b9VX2D9C6zlouu3ZyLNHwjmjFmp55snpIc5VGwLGIWoTT6N/GhIQG4iVAcFtffg0rM3dYuoCHTkWi4J5bL2mK8ucT/hZwEGFIUtBEdAZekmpZSZTdyFjHGfNttVGS8jdjAcddXEhJvfCZNMKGKKM2lIElrYlYbhwHdm8o61JhBc6hnUi9OXtIGo51eRzXmwB87w02tI8x4ecgDleedbKboCQwPr5Joo1943pXRybt33qyPQeo2nV6Oq4u8/pS9c3eT3zlGscGAOGX1a+fsRc0bS6Fg5rAEQ8UH8rLv9TlMEdWt47iYLL83jlkVBunR9ZD5r0NIV2OK7owHavqHWfVqaEmq3htX3KgevbiRVM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(6506007)(54906003)(478600001)(110136005)(186003)(71200400001)(122000001)(7696005)(66476007)(66556008)(4326008)(66446008)(64756008)(83380400001)(9686003)(66946007)(38100700002)(76116006)(5660300002)(4744005)(52536014)(33656002)(41300700001)(38070700005)(2906002)(316002)(8676002)(8936002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WituaXBoSVU0QW52MG1rYXlvNzdIZlAvNEJ4MTRkaEJuRVBBclE0UlZ5K1dN?=
 =?utf-8?B?bHBSdThGYS9mYi9vcTFwTmRNTnR4bmJ6R1Z1MkdHaVBkYUhVWUlXMTNTT3hx?=
 =?utf-8?B?dGlOMUlWUGlQWjk2Mm41Z0N0Z0hxNDVkRVlzQXNtUEt5cHVHUFF3SGxNTkY3?=
 =?utf-8?B?VjJaeGpkMFhPa3dqelFlOXJ3eGkzZ0M1MDZDVUJMSmZFSnJqdUwvWTdSVURo?=
 =?utf-8?B?WjM0Q0dwT1cwMTFFZk1TRUxNbGZNdFJLVk1iMHlUekx0bE01cmVCanBLVC9o?=
 =?utf-8?B?b2M1WkR5ajJDSGo5aG0xcnI1eTZpYjdZYWE3cFRwWXVCKzBZeEswV01qcXRv?=
 =?utf-8?B?UURKeWxaK3ZJSEhPM0dZaXFuZUVza29EYnBsSVBrZW9hUGNnTGl5UnkycENY?=
 =?utf-8?B?S0kwb0toTzcwcXdqWDJxUklOZW53ZDFZQkFZRWZJa0QwbmRtdVMzZzJEKzE5?=
 =?utf-8?B?Ni9hWkVOUDZTZUhBdlBXSDE2WEsyd05nS1JsRGljY2FUUXFFdlRDL2ZWdVMw?=
 =?utf-8?B?K3IyeUgwU2tCM1g4QWo3YThzU3F4VXRWcVpUQ3FFMHBsT0dWRnF1S2ViczE0?=
 =?utf-8?B?NjJmbDVmdmZXMmZmQVlzWWFpS1ZsTHhDNjZGTEpmdGErcEF2RnZtMjlGek9Y?=
 =?utf-8?B?MHU1Y3o4L3FOdUhwQXBwMVRabWl3djFhNHpVYjlzZVpaWUpEYkVLNXJiaFN1?=
 =?utf-8?B?TVBxZzEyY2Q2MTRHVmhRL0UwWG5yWmt6YUdWV0hLd2twV1pxbVZFZWlOOUEx?=
 =?utf-8?B?MXFhVDVSMnZJdjIrUVc5ZzZoaGNzTDAwZWYrY0xzbzRJd01qNytqY0tFbTJX?=
 =?utf-8?B?ZWx1R1NaM1ZGdjI3NWVhUEdjUzhIYUVIaEx3Y0FyQ1NLR1Y4VS80OTlBeksy?=
 =?utf-8?B?V1RDdFZ1MDd1VnF1TzdxR3djM1Q4dlR2akNwd3hhWkVkMTAvd3FaNDhiWk1I?=
 =?utf-8?B?UEdyUWtLM21JaXFGeTBhQlM2WXd5NnltRmM3RTdjUnZPSm9xVzZLNXBOQWJx?=
 =?utf-8?B?Y3JjWEhYZytmSnJqNnBsTXVMR0trdDlSdFlUNG5QT3BxM3paaVpsZ1lsZ2J4?=
 =?utf-8?B?NmlzdEVQdHlUbWJGckhnZkZOUVowMVFMVTl5N2F5VHNRTUxJNVFVamxxSVRI?=
 =?utf-8?B?TjRPazMyMXVXeTZWc0J1TnQyR0FLcDVHMEtQM3U3b0ZrYW1ZSUg3cWFwZ2hr?=
 =?utf-8?B?ZnpnUk1nVS96OW9VelMzNFdJcCtKS0g2QjNWNHVPSzVlYlRGT0NORVhtMEc5?=
 =?utf-8?B?U1lhUnB4aWRnOUdHblRZVXNQNWZ1Z1JwRWFwYkJJMXlzODY0ZXdDOTE3SVI3?=
 =?utf-8?B?SVdhbFRMTy9sVG1DdlV0SWVld2lkYkZ3b3dZVWFDakN4dlRiQVJUankyN084?=
 =?utf-8?B?cFI5SnVIT2wxS3NpcUVTaHZ6VXNQMzYvVFFiLzRyVXdMSmlha2NpeEtjVW5y?=
 =?utf-8?B?NDNYa1pUUUZTeVRwaHVMOVgvYmdYVGttUnJ1UXBhd2hkMkFWOGpSRit4QUM0?=
 =?utf-8?B?eFR3NG81UnJ4clNMSzJxYXduQ0JrNzQ1S0h2OXdLUHJoS0JpZFB2dW03bFAz?=
 =?utf-8?B?RlI4K25nR1pkL0wxUFo1eVhvSkoyd1NYeHFlV3RqUVMrZURHd3JlMXNKa3VU?=
 =?utf-8?B?c3A5UDFRSER6SXlBQ0thRXI4QUpaQWsxb2V2VVNldGRDV3hUUWRWK1QrN3lG?=
 =?utf-8?B?MWI4N0lvVDdHSlQxUWo4U0xjVU1TbWlrZnpZMEF2UlFBeTlPaWVhM0pBb0ox?=
 =?utf-8?B?UC81TTRsYVMyeHpOci9MWTB1NkszdHd5eEp2bXVuMlhHWTdGNjZqTlF6V3lT?=
 =?utf-8?B?K0h4UjE2d1VnS2xHdGtKV0NkZ2tIbDdGSFVzVjQ4N0NtNVVTeVQ5UVoybVZO?=
 =?utf-8?B?NjVQTEhSU2lyT0lsV3VSaUlFRURzOENXd09QR1N3TzN0WnhCTHd6KzRFYWpQ?=
 =?utf-8?B?WjF6N0g3QVlqcURzaUhOVm8vVWc5RDFrUDBtbzZMc2hlQklldFNUTVg1Z2hx?=
 =?utf-8?B?cHFHcm1IekZxOUtUQjljWVZOcnoyUzRnNnZwRGwxM2daSENzUTNUcSszM09O?=
 =?utf-8?B?MXNpZkRtTXFqYXAzZzlRcWl4SXZJWExUMzRkRk1BYldtVi8xeGx6QXAxQ1NK?=
 =?utf-8?B?QWNpbkREdU5xcUozQWo3azhvZFhYVnUxVmRDVGx5Zm9GeHQzYjB4dTBKSzh4?=
 =?utf-8?Q?yfHmeODoaDzQYSo7NnmbL8A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f758cf19-8306-4586-da73-08db916a28f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 02:02:14.2351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btQHnjN42jQfsTag/p8ukRi2chb3YolAYuDT09bP7ZW1/VhCcjbs6Cxd+kNOcNTvkv9BcDMM711n4sr81yKbOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249
Subject: RE: [virtio-comment] About the plan of Admin Queue

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgSnVseSAzMSwgMjAyMyA2OjUwIEFNDQo+ID4gU28gSSB0aGluayBzb21lIHRoaW5ncyBsaWtl
IHJpbmcgc2l6ZSwgcXVldWUgbnVtLCBpbnRlcnJ1cHRzIGV0Yy4gYXJlDQo+ID4gY29uZmlndXJl
ZCBieSB0aGUgYWRtaW4gcXVldWUuIFZGJ3MgaXAsIG1hYyBzaG91bGQgYmUgY29uZmlndXJlZCBi
eSBQRidzIGN2cS4NCg0KVkYncyBtYWMgc2hvdWxkIGJlIGNvbmZpZ3VyZWQgYnkgaXRzZWxmIHVz
aW5nIGl0cyBvd24gY3ZxLiBUaGVyZSBpcyBubyBtZWRpYXRpb24gcmVxdWlyZWQuDQo=

